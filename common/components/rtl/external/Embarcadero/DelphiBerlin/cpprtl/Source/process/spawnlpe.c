/*-----------------------------------------------------------------------*
 * filename - spawnlpe.c
 *
 * function(s)
 *        spawnlpe - creates and runs child processes
 *        _wspawnlpe - creates and runs child processes
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 34072 $        */

#include <_process.h>
#include <stddef.h>
#include <tchar.h>
#include <_tchar.h>
#include <stdarg.h>

/*--------------------------------------------------------------------------*

Name            spawnlpe, _wspawnlpe - creates and runs child processes

Usage           #include <process.h>
                int spawnlpe(int modeF, const char *pathP, const char *arg0,
                             const char *arg1, ..., const char *argn,
                             NULL, const char *envP[]);
                int _wspawnlpe(int modeF, const wchar_t *pathP, const wchar_t *arg0,
                             const wchar_t *arg1, ..., const wchar_t *argn,
                             NULL, const wchar_t *envP[]);


Prototype in    process.h

Description     The  functions  in  the  spawn...  family  create  and  run
                (execute) other files, known as child processes. There must
                be  sufficient memory  available for  loading and executing
                the child process.

                The  value  of  modeP  determines  what  action the calling
                function  (the parent  process) will  take after  the spawn
                call. The possible values of modeP are:

                        P_WAIT          Puts parent process "on hold" until
                                        child process completes execution.

                        P_NOWAIT        Continues  to  run  parent  process
                                        while child process runs.

                        P_OVERLAY       Overlays  child  process  in memory
                                        location   formerly   occupied   by
                                        parent. Same as exec... call.

                Note: P_NOWAIT  is currently not  available; using it  will
                generate an error value.

                pathP is  the file name   of the called  child process. The
                spawn... functions  search for pathname using  the standard
                MS-DOS search algorithm:

                        . no  extension or no period-search  for exact file
                          name;  if  not  successful,  add  .EXE and search
                          again

                        . extension given-search only for exact file name

                        . period  given-search only for  file name with  no
                          extension

                The suffixes l, v, p and e added to  spawn... "family name"
                specify that  the named function will  operate with certain
                capabilities.

                        p specifies  that the function will  search for the
                          child in  those directories specified by  the DOS
                          PATH environment variable.  Without the p suffix,
                          the  function only  searches the root and current
                          working directory.

                        l specifies that the argument pointers (arg0, arg1,
                          ...,  argn)  are  passed  as  separate arguments.
                          Typically, the l suffix is  used when you know in
                          advance the  number of arguments to  be passed. A
                          mandatory  NULL following  argn marks  the end of
                          the list.

                        v specifies  that  the argument  pointers (argv[0],
                          argv[1], ..., argv[n]) are  passed as an array of
                          pointers.  Typically,  the  v  suffix  is  used a
                          variable number of arguments is to be passed.

                        e specifies that the  argument envp maybe passed to
                          the  child  process,  allowing  you  to alter the
                          environment for the child  process. Without the e
                          suffix, child process inherits the environment of
                          the parent process.  This environment argument is
                          an  array of  char *.  Each element  points to  a
                          null-terminated character string of the form:

                                envar=value

                          where  envar  is  the   name  of  an  environment
                          variable, and value is  the string value to which
                          envar is set. The last element of envp[] is NULL.
                          When  envp[0]  is  NULL,  the  child inherits the
                          parent's environment settings.

                The spawn... functions  must have at least one  argument to
                the child process. This argument  is, by convention, a copy
                of pathname.  Under MS-DOS 3.x,  pathname is available  for
                the child process; under earlier versions, the child cannot
                use the passed value of arg0 (or argv[0]).

                When  an spawn...  function call   is made,  any open  files
                remain open in the child process.

Return value    On a  successful execution, the  return value is  the child
                process's exit  status (0 for  normal termination). If  the
                child specifically calls exit with a non-zero argument, its
                exit status can be set to a non-zero value.
                On error, the spawn...  functions return -1, and errno  is set
                to  one of  the following:
                        E2BIG   Argument list too long
                        EINVAL  Invalid argument
                        ENOENT  Path or file name not found
                        ENOEXEC Exec format  error
                        ENOMEM  Not enough core

*---------------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC _tspawnlpe(int modeF, const _TCHAR *pathP, const _TCHAR *arg0, ...)
{
#if defined(_WIN64)
    _TCHAR **argv;
    _TCHAR   **p;
    va_list ap;
    int ret;
  
    va_start(ap, arg0);
    /* One extra parameter (env) after arguments */
    argv = _tmake_arglist(arg0, ap, 1);
    va_end(ap);
    /* Find the end of the argument list */
    for (p = argv; *p != NULL; p++)
        ;
    p++;
    ret = _tLoadProg(modeF, pathP, argv, (const _TCHAR **)*p, 1);
    if (argv)
        free(argv);
    return ret;
#else
    const _TCHAR   **p;

    /* Find the end of the argument list */
    for (p = &arg0; *p++ != NULL; );
    return _tLoadProg(modeF, pathP, &arg0, (const _TCHAR **)*p, 1);
#endif
}
