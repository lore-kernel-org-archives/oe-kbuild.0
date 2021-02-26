Content-Type: multipart/mixed; boundary="===============1088315921796768149=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] tracing: Add a verifier to check string pointers for trace events
Date: Sat, 27 Feb 2021 06:23:28 +0800
Message-ID: <202102270625.qmd4gR3t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1088315921796768149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210226190705.871102407@goodmis.org>
References: <20210226190705.871102407@goodmis.org>
TO: Steven Rostedt <rostedt@goodmis.org>

Hi Steven,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20210226]
[cannot apply to tip/perf/core linux/master hnaz-linux-mm/master v5.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Steven-Rostedt/tracing-Det=
ect-unsafe-dereferencing-of-pointers-from-trace-events/20210227-030901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8b83369ddcb3fb9cab5c1088987ce477565bb630
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   kernel/trace/trace.c:4910:8: warning: snprintf format string requires 2 =
parameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(NULL, 0, "%*pbn",
          ^
   kernel/trace/trace.c:4916:8: warning: snprintf format string requires 2 =
parameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(mask_str, len, "%*pbn",
          ^
>> kernel/trace/trace.c:3623:10: warning: Either the condition '!fmt' is re=
dundant or there is possible null pointer dereference: p. [nullPointerRedun=
dantCheck]
    while (*p) {
            ^
   kernel/trace/trace.c:3616:19: note: Assuming that condition '!fmt' is no=
t redundant
    if (WARN_ON_ONCE(!fmt))
                     ^
   kernel/trace/trace.c:3612:18: note: Assignment 'p=3Dfmt', assigned value=
 is 0
    const char *p =3D fmt;
                    ^
   kernel/trace/trace.c:3623:10: note: Null pointer dereference
    while (*p) {
            ^

vim +3623 kernel/trace/trace.c

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3596) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3597) /**
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3598)  * trace_check_vpr=
intf - Check dereferenced strings while writing to the seq buffer
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3599)  * @iter: The iter=
ator that holds the seq buffer and the event being printed
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3600)  * @fmt: The forma=
t used to print the event
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3601)  * @ap: The va_lis=
t holding the data to print from @fmt.
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3602)  *
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3603)  * This writes the=
 data into the @iter->seq buffer using the data from
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3604)  * @fmt and @ap. I=
f the format has a %s, then the source of the string
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3605)  * is examined to =
make sure it is safe to print, otherwise it will
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3606)  * warn and print =
"[UNSAFE MEMORY]" in place of the dereferenced string
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3607)  * pointer.
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3608)  */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3609) void trace_check_v=
printf(struct trace_iterator *iter, const char *fmt,
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3610) 			 va_list ap)
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3611) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3612) 	const char *p =3D=
 fmt;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3613) 	const char *str;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3614) 	int i, j;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3615) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3616) 	if (WARN_ON_ONCE(=
!fmt))
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3617) 		return;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3618) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3619) 	/* Don't bother c=
hecking when doing a ftrace_dump() */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3620) 	if (iter->fmt =3D=
=3D static_fmt_buf)
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3621) 		goto print;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3622) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26 @3623) 	while (*p) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3624) 		j =3D 0;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3625) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3626) 		/* We only care =
about %s and variants */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3627) 		for (i =3D 0; p[=
i]; i++) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3628) 			if (i + 1 >=3D =
iter->fmt_size) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3629) 				/*
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3630) 				 * If we can't=
 expand the copy buffer,
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3631) 				 * just print =
it.
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3632) 				 */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3633) 				if (!trace_ite=
r_expand_format(iter))
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3634) 					goto print;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3635) 			}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3636) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3637) 			if (p[i] =3D=3D=
 '\\' && p[i+1]) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3638) 				i++;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3639) 				continue;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3640) 			}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3641) 			if (p[i] =3D=3D=
 '%') {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3642) 				/* Need to tes=
t cases like %08.*s */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3643) 				for (j =3D 1; =
p[i+j]; j++) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3644) 					if (isdigit(p=
[i+j]) ||
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3645) 					    p[i+j] =
=3D=3D '*' ||
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3646) 					    p[i+j] =
=3D=3D '.')
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3647) 						continue;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3648) 					break;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3649) 				}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3650) 				if (p[i+j] =3D=
=3D 's')
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3651) 					break;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3652) 			}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3653) 			j =3D 0;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3654) 		}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3655) 		/* If no %s foun=
d then just print normally */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3656) 		if (!p[i])
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3657) 			break;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3658) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3659) 		/* Copy up to th=
e %s, and print that */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3660) 		strncpy(iter->fm=
t, p, i);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3661) 		iter->fmt[i] =3D=
 '\0';
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3662) 		trace_seq_vprint=
f(&iter->seq, iter->fmt, ap);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3663) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3664) 		/* The ap now po=
ints to the string data of the %s */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3665) 		str =3D va_arg(a=
p, const char *);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3666) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3667) 		/*
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3668) 		 * If you hit th=
is warning, it is likely that the
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3669) 		 * trace event i=
n question used %s on a string that
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3670) 		 * was saved at =
the time of the event, but may not be
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3671) 		 * around when t=
he trace is read. Use __string(),
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3672) 		 * __assign_str(=
) and __get_str() helpers in the TRACE_EVENT()
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3673) 		 * instead. See =
samples/trace_events/trace-events-sample.h
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3674) 		 * for reference.
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3675) 		 */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3676) 		if (WARN_ON_ONCE=
(!trace_safe_str(iter, str))) {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3677) 			int ret;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3678) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3679) 			/* Try to safel=
y read the string */
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3680) 			ret =3D strncpy=
_from_kernel_nofault(iter->fmt, str,
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3681) 							  iter->fmt=
_size);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3682) 			if (ret < 0)
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3683) 				trace_seq_prin=
tf(&iter->seq, "(0x%px)", str);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3684) 			else
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3685) 				trace_seq_prin=
tf(&iter->seq, "(0x%px:%s)",
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3686) 						 str, iter->=
fmt);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3687) 			str =3D "[UNSAF=
E-MEMORY]";
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3688) 			strcpy(iter->fm=
t, "%s");
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3689) 		} else {
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3690) 			strncpy(iter->f=
mt, p + i, j + 1);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3691) 			iter->fmt[j+1] =
=3D '\0';
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3692) 		}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3693) 		trace_seq_printf=
(&iter->seq, iter->fmt, str);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3694) =

43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3695) 		p +=3D i + j + 1;
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3696) 	}
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3697)  print:
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3698) 	if (*p)
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3699) 		trace_seq_vprint=
f(&iter->seq, p, ap);
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3700) }
43930a0d94b958 Steven Rostedt (VMware  2021-02-26  3701) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1088315921796768149==--

