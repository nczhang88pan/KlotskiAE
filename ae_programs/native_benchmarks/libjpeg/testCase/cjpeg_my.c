/*
 * cjpeg.c
 *
 * Copyright (C) 1991-1998, Thomas G. Lane.
 * Modified 2003-2013 by Guido Vollbeding.
 * This file is part of the Independent JPEG Group's software.
 * For conditions of distribution and use, see the accompanying README file.
 *
 * This file contains a command-line user interface for the JPEG compressor.
 * It should work on any system with Unix- or MS-DOS-style command lines.
 *
 * Two different command line styles are permitted, depending on the
 * compile-time switch TWO_FILE_COMMANDLINE:
 *	cjpeg [options]  inputfile outputfile
 *	cjpeg [options]  [inputfile]
 * In the second style, output is always to standard output, which you'd
 * normally redirect to a file or pipe to some other program.  Input is
 * either from a named file or from standard input (typically redirected).
 * The second style is convenient on Unix but is unhelpful on systems that
 * don't support pipes.  Also, you MUST use the first style if your system
 * doesn't do binary I/O to stdin/stdout.
 * To simplify script writing, the "-outfile" switch is provided.  The syntax
 *	cjpeg [options]  -outfile outputfile  inputfile
 * works regardless of which command line style is used.
 */

#include "cdjpeg.h"		/* Common decls for cjpeg/djpeg applications */
#include "jversion.h"		/* for version message */

#ifdef USE_CCOMMAND		/* command-line reader for Macintosh */
#ifdef __MWERKS__
#include <SIOUX.h>              /* Metrowerks needs this */
#include <console.h>		/* ... and this */
#endif
#ifdef THINK_C
#include <console.h>		/* Think declares it here */
#endif
#endif
#include <time.h>
/* Create the add-on message string table. */

#define JMESSAGE(code,string)	string ,

static const char * const cdjpeg_message_table[] = {
#include "cderror.h"
  NULL
};


/*
 * This routine determines what format the input file is,
 * and selects the appropriate input-reading module.
 *
 * To determine which family of input formats the file belongs to,
 * we may look only at the first byte of the file, since C does not
 * guarantee that more than one character can be pushed back with ungetc.
 * Looking at additional bytes would require one of these approaches:
 *     1) assume we can fseek() the input file (fails for piped input);
 *     2) assume we can push back more than one character (works in
 *        some C implementations, but unportable);
 *     3) provide our own buffering (breaks input readers that want to use
 *        stdio directly, such as the RLE library);
 * or  4) don't put back the data, and modify the input_init methods to assume
 *        they start reading after the start of file (also breaks RLE library).
 * #1 is attractive for MS-DOS but is untenable on Unix.
 *
 * The most portable solution for file types that can't be identified by their
 * first byte is to make the user tell us what they are.  This is also the
 * only approach for "raw" file types that contain only arbitrary values.
 * We presently apply this method for Targa files.  Most of the time Targa
 * files start with 0x00, so we recognize that case.  Potentially, however,
 * a Targa file could start with any byte value (byte 0 is the length of the
 * seldom-used ID field), so we provide a switch to force Targa input mode.
 */

static boolean is_targa;	/* records user -targa switch */


LOCAL(cjpeg_source_ptr)
select_file_type (j_compress_ptr cinfo, FILE * infile)
{
  return jinit_read_ppm(cinfo);
//  int c;
//
//  if ((c = getc(infile)) == EOF)
//    ERREXIT(cinfo, JERR_INPUT_EMPTY);
//  if (ungetc(c, infile) == EOF)
//    ERREXIT(cinfo, JERR_UNGETC_FAILED);
//
//  switch (c) {
//#ifdef BMP_SUPPORTED
//  case 'B':
//    return jinit_read_bmp(cinfo);
//#endif
//#ifdef GIF_SUPPORTED
//  case 'G':
//    return jinit_read_gif(cinfo);
//#endif
//#ifdef PPM_SUPPORTED
//  case 'P':
//    return jinit_read_ppm(cinfo);
//#endif
//#ifdef RLE_SUPPORTED
//  case 'R':
//    return jinit_read_rle(cinfo);
//#endif
//#ifdef TARGA_SUPPORTED
//  case 0x00:
//    return jinit_read_targa(cinfo);
//#endif
//  default:
//    ERREXIT(cinfo, JERR_UNKNOWN_FORMAT);
//    break;
//  }
//
//  return NULL;			/* suppress compiler warnings */
}


/*
 * Argument-parsing code.
 * The switch parser is designed to be useful with DOS-style command line
 * syntax, ie, intermixed switches and file names, where only the switches
 * to the left of a given file name affect processing of that file.
 * The main program in this file doesn't actually use this capability...
 */


static const char * progname;	/* program name for error messages */
// static char * outfilename = "/home/Pan960/Klotski/libjpeg/testCase/outputDir/download_1.jpg";	/* for -outfile switch */
char * infilename = NULL;
char * outfilename = NULL;

LOCAL(int)
parse_switches (j_compress_ptr cinfo,
		int last_file_arg_seen, boolean for_real)
/* Parse optional switches.
 * Returns argv[] index of first file-name argument (== argc if none).
 * Any file names with indexes <= last_file_arg_seen are ignored;
 * they have presumably been processed in a previous iteration.
 * (Pass 0 for last_file_arg_seen on the first or only iteration.)
 * for_real is FALSE on the first (dummy) pass; we may skip any expensive
 * processing.
 */
{

  cinfo->err->trace_level = 0;
  is_targa = FALSE;
  cinfo->dct_method = JDCT_ISLOW;
  return 1;			/* return index of next arg (file name) */
}


/*
 * The main program.
 */
 #define ITERATION 1

char buf[64];
int
//main (int argc, char **argv)
enclave_main ()
{
  asm("movq %%rdi,%0\n":"=m"(infilename));
  asm("movq %%rsi,%0\n":"=m"(outfilename));
  struct jpeg_compress_struct cinfo;
  struct jpeg_error_mgr jerr;
#ifdef PROGRESS_REPORT
  struct cdjpeg_progress_mgr progress;
#endif
  int file_index;
  cjpeg_source_ptr src_mgr;
  FILE * input_file;
  FILE * output_file;
  JDIMENSION num_scanlines;
    unsigned long timeStamp;

   char outfilename_temp[128];/* for -outfile switch */
   char infilename_temp[128];

  progname = "cjpeg";		/* in case C library doesn't provide it */
for(int j=0;j<10;j++){
  sprintf(infilename_temp, "%s_%d.ppm", infilename, j);
  puts(infilename_temp);
  for(int itr=0;itr<100;itr++){
      sprintf(outfilename_temp, "%s_%d.%d.jpg", outfilename, j, itr);
  timeStamp = clock();
for(int i=0;i<ITERATION;i++){
  /* Initialize the JPEG compression object with default error handling. */
  cinfo.err = jpeg_std_error(&jerr);
  jpeg_create_compress(&cinfo);              //jpeg_CreateCompress
  /* Add some application-specific error messages (from cderror.h) */
  jerr.addon_message_table = cdjpeg_message_table;
  jerr.first_addon_message = JMSG_FIRSTADDONCODE;
  jerr.last_addon_message = JMSG_LASTADDONCODE;

  /* Initialize JPEG parameters.
   * Much of this may be overridden later.
   * In particular, we don't yet know the input file's color space,
   * but we need to provide some value for jpeg_set_defaults() to work.
   */

  cinfo.in_color_space = JCS_RGB; /* arbitrary guess */
  jpeg_set_defaults(&cinfo);
  /* Scan command line to find file names.
   * It is convenient to use just one switch-parsing routine, but the switch
   * values read here are ignored; we will rescan the switches after opening
   * the input file.
   */
  file_index = parse_switches(&cinfo, 0, FALSE);

  /* Open the input file. */
    if ((input_file = fopen(infilename_temp, READ_BINARY)) == NULL) {
      sprintf(buf, "%s: can't open %s\n", progname, infilename_temp);
      puts(buf);
      exit(EXIT_FAILURE);
    }

  /* Open the output file. */
  if (outfilename != NULL) {
    if ((output_file = fopen(outfilename_temp, WRITE_BINARY)) == NULL) {
      sprintf(buf, "%s: can't open %s\n", progname, outfilename_temp);
        puts(buf);
      exit(EXIT_FAILURE);
    }
  }
  /* Figure out the input file format, and set up to read it. */
  src_mgr = select_file_type(&cinfo, input_file);
  src_mgr->input_file = input_file;

  /* Read the input file header to obtain file size & colorspace. */
  (*src_mgr->start_input) (&cinfo, src_mgr);
  /* Now that we know input colorspace, fix colorspace-dependent defaults */
  jpeg_default_colorspace(&cinfo);
  /* Adjust default compression parameters by re-parsing the options */
  file_index = parse_switches(&cinfo, 0, TRUE);
  /* Specify data destination for compression */
  jpeg_stdio_dest(&cinfo, output_file);
  /* Start compressor */
  jpeg_start_compress(&cinfo, TRUE);

  /* Process data */
  while (cinfo.next_scanline < cinfo.image_height) {
    num_scanlines = (*src_mgr->get_pixel_rows) (&cinfo, src_mgr);
    (void) jpeg_write_scanlines(&cinfo, src_mgr->buffer, num_scanlines);
  }


  /* Finish compression and release memory */
  (*src_mgr->finish_input) (&cinfo, src_mgr);
  jpeg_finish_compress(&cinfo);
  jpeg_destroy_compress(&cinfo);

  /* Close files, if we opened them */
  if (input_file != stdin)
    fclose(input_file);
  if (output_file != stdout)
    fclose(output_file);
}
timeStamp = clock() - timeStamp;
printf("%.13f",(double)timeStamp/((double)ITERATION*(double)1000000l));


}}
printf("all done\n");

  /* All done. */
  exit(jerr.num_warnings ? EXIT_WARNING : EXIT_SUCCESS);
  return 0;			/* suppress no-return-value warnings */
}
