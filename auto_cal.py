import numpy
import math

RESULT_PATH = "./ae_programs/resultDir/"
DJPEG_PATH = RESULT_PATH + "djpeg/"
CJEPG_PATH = RESULT_PATH + "cjpeg/"
NBENCH_PATH = RESULT_PATH + "nbench/"


def geomean(xs):
    return math.exp(math.fsum(math.log(x) for x in xs) / len(xs))


def convert_to_str(value, max_len=10):
    val_str = "%.10f" % float(value)
    val_str = val_str if len(val_str) < max_len else val_str[:max_len]
    return val_str


def cal_results(src_means, klotski_means, cache_size_list):
    # for itr in range(0, 10):
    #     value_str = str(src_means[itr])
    #     value_str = value_str if len(value_str) < 6 else value_str[:6]

    tmp_performance_overhead = {}
    for prefix in ["Result.withORAM.", "Result.withORAM.RPS."]:
        for cache_size in cache_size_list:
            index = prefix + str(cache_size)
            mean = klotski_means[index]
            tmp_performance_overhead[index] = (mean / src_means)
            # print(index, tmp_performance_overhead[index])

    # title
    output = "Origin  "
    for cache_size in cache_size_list:
        output = output + "CZ=" + str(cache_size) + "    "
    print(output)

    # show each line
    for prefix in ["Result.withORAM.", "Result.withORAM.RPS."]:
        print(prefix)
        for itr in range(0, len(src_means)):
            output = convert_to_str(src_means[itr])
            for cache_size in cache_size_list:
                index = prefix + str(cache_size)
                # src_mean
                output = output + "\t" + convert_to_str(tmp_performance_overhead[index][itr] - 1, 6) + "x"

            print(output)

        # show GEOMEAN
        print("------")
        output = "GEOMEA  "
        for cache_size in cache_size_list:
            index = prefix + str(cache_size)
            output += convert_to_str(geomean(tmp_performance_overhead[index]) - 1, 5) + "x\t"
        print(output)
        print("------")

    return


def cal_nbench_results(src_means, klotski_means, cache_size_list, benchmark_name_list):
    print("the mean time of handling each image is:")
    # for itr in range(0, 10):
    #     value_str = str(src_means[itr])
    #     value_str = value_str if len(value_str) < 6 else value_str[:6]

    tmp_performance_overhead = {}
    for prefix in ["Result.withORAM."]:
        for cache_size in cache_size_list:
            index = prefix + str(cache_size)
            mean = klotski_means[index]
            tmp_performance_overhead[index] = (mean / src_means)
            # print(index, tmp_performance_overhead[index])

    # title
    output = "Origin  "
    for cache_size in cache_size_list:
        output = output + "CZ=" + str(cache_size) + "    "
    print(output)

    # show each line
    for prefix in ["Result.withORAM."]:
        print(prefix)
        for itr in range(0, len(src_means)):
            output = convert_to_str(src_means[itr])
            for cache_size in cache_size_list:
                index = prefix + str(cache_size)
                # src_mean
                output = output + "\t" + convert_to_str(tmp_performance_overhead[index][itr], 5) + "x"

            print(output)

        # show GEOMEAN
        print("------")
        output = "GEOMEA  "
        for cache_size in cache_size_list:
            index = prefix + str(cache_size)
            output += convert_to_str(geomean(tmp_performance_overhead[index]), 5) + "x\t"
        print(output)
        print("------")

    return

def calculate_cjpeg(result_path):
    print("processing CJPEG:")
    cache_size_list = [2, 4, 8, 16, 32]

    # get the original results
    org_file = result_path + "Result.original"

    org_results = {"0":[]}
    cur_ppm_name = "0"
    with open(org_file, "r") as fp:
        line_num = 0

        for line in fp.readlines():
            line_num = line_num + 1
            if line_num < 36:
                continue
            if line.startswith("/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/ppm"):
                cur_ppm_name = line.split("/")[-1][9:-5]
                org_results[cur_ppm_name] = []
                continue
            elif line.startswith("all done"):
                continue
            org_results[cur_ppm_name].append(float(line))

    org_mean = []
    for itr in range(0, 10):
        times = numpy.array(org_results[str(itr)])
        org_mean.append(numpy.mean(times))

    org_mean = numpy.array(org_mean)

    # get Klotski results
    def handle_klotski_results(filepath):
        new_results = {"0": []}
        cur_ppm_name = "0"
        with open(filepath, "r") as fp:
            line_num = 0
            for line in fp.readlines():
                line_num = line_num + 1
                if line_num < 7:
                    continue
                if line.startswith("/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/ppm"):
                    cur_ppm_name = line.split("/")[-1][9:-5]
                    new_results[cur_ppm_name] = []
                    continue
                elif line.startswith("all done"):
                    continue
                new_results[cur_ppm_name].append(float(line))

        return new_results

    result = {}
    klotski_mean_results = {}
    for cache_size in cache_size_list:
        for prefix in ["Result.withORAM.", "Result.withORAM.RPS."]:
            src_result_file = result_path + prefix + str(cache_size)
            result[prefix + str(cache_size)] = handle_klotski_results(src_result_file)
            klotski_mean_results[prefix + str(cache_size)]=[]

            for itr in range(0, 10):
                times = numpy.array(result[prefix + str(cache_size)][str(itr)])
                klotski_mean_results[prefix + str(cache_size)].append(numpy.mean(times))

    cal_results(org_mean, klotski_mean_results, cache_size_list)

def calculate_djpeg(result_path):
    print("\n\nprocessing DJPEG:")
    cache_size_list = [2,4,8,16,32]

    # get the original results
    org_file = result_path + "Result.original"

    org_results = {"0":[]}
    cur_ppm_name = "0"
    with open(org_file, "r") as fp:
        line_num = 0

        for line in fp.readlines():
            line_num = line_num + 1
            if line_num < 36:
                continue
            if line.startswith("/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/jpg"):
                cur_ppm_name = line.split("/")[-1][9:-5]
                org_results[cur_ppm_name] = []
                continue
            elif line.startswith("all done"):
                continue
            org_results[cur_ppm_name].append(float(line))

    org_mean = []
    for itr in range(0, 10):
        times = numpy.array(org_results[str(itr)])
        org_mean.append(numpy.mean(times))

    org_mean = numpy.array(org_mean)

    # get Klotski results
    def handle_klotski_results(filepath):
        new_results = {"0": []}
        cur_ppm_name = "0"
        with open(filepath, "r") as fp:
            line_num = 0
            for line in fp.readlines():
                line_num = line_num + 1
                if line_num < 4:
                    continue
                if line.startswith("/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/jpg"):
                    cur_ppm_name = line.split("/")[-1][9:-5]
                    new_results[cur_ppm_name] = []
                    continue
                elif line.startswith("all done"):
                    continue
                new_results[cur_ppm_name].append(float(line))

        return new_results

    result = {}
    klotski_mean_results = {}
    for cache_size in cache_size_list:
        for prefix in ["Result.withORAM.", "Result.withORAM.RPS."]:
            src_result_file = result_path + prefix + str(cache_size)
            result[prefix + str(cache_size)] = handle_klotski_results(src_result_file)
            klotski_mean_results[prefix + str(cache_size)]=[]

            for itr in range(0, 10):
                times = numpy.array(result[prefix + str(cache_size)][str(itr)])
                klotski_mean_results[prefix + str(cache_size)].append(numpy.mean(times))

    cal_results(org_mean, klotski_mean_results, cache_size_list)


def calculate_nbench(result_path):
    print("\n\nprocessing NBENCH:")
    cache_size_list = [2, 4, 8]
    # cache_size_list = [2
    # get the original results
    org_file = result_path + "Result.orginal"

    org_results = {"NUMERIC SORT":[]}
    cur_benchmark_name = "NUMERIC SORT"
    benchmark_list = [cur_benchmark_name]
    with open(org_file, "r") as fp:
        line_num = 0

        for line in fp.readlines():
            line_num = line_num + 1
            if line_num < 48:
                continue
            if line.startswith("===="):
                break

            try:
                cost_time = float(line)
                org_results[cur_benchmark_name].append(cost_time)
            except:
                cur_benchmark_name = " ".join([x for x in line.split(" ") if len(x) > 0][:-1])
                org_results[cur_benchmark_name] = []
                benchmark_list.append(cur_benchmark_name)
                continue


    org_mean = []
    for bench_name in benchmark_list:
        times = numpy.array(org_results[bench_name])
        org_mean.append(numpy.mean(times))

    org_mean = numpy.array(org_mean)

    # get Klotski results
    def handle_klotski_results(filepath):

        new_results = {"NUMERIC SORT": []}
        cur_benchmark_name = "NUMERIC SORT"
        benchmark_list = [cur_benchmark_name]
        with open(filepath, "r") as fp:
            line_num = 0
            for line in fp.readlines():
                line_num = line_num + 1
                if line_num < 16:
                    continue
                if line.startswith("timestamp"):
                    break

                try:
                    cost_time = float(line)
                    new_results[cur_benchmark_name].append(cost_time)
                except:
                    cur_benchmark_name = " ".join([x for x in line.split(" ") if len(x) > 0][:-1])
                    new_results[cur_benchmark_name] = []
                    benchmark_list.append(cur_benchmark_name)
                    continue

        return new_results

    result = {}
    klotski_mean_results = {}
    for cache_size in cache_size_list:
        for prefix in ["Result.withORAM."]:
            src_result_file = result_path + prefix + str(cache_size)
            result[prefix + str(cache_size)] = handle_klotski_results(src_result_file)
            klotski_mean_results[prefix + str(cache_size)]=[]

            for bench_name in benchmark_list:
                times = numpy.array(result[prefix + str(cache_size)][bench_name])
                klotski_mean_results[prefix + str(cache_size)].append(numpy.mean(times))

    cal_nbench_results(org_mean, klotski_mean_results, cache_size_list, benchmark_list)


if __name__ == '__main__':
    # calculate_nbench(NBENCH_PATH)
    calculate_cjpeg(CJEPG_PATH)
    calculate_djpeg(DJPEG_PATH)

