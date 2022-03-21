Content-Type: multipart/mixed; boundary="===============2655652896934429142=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] tracing: Have type enum modifications copy the strings
Date: Mon, 21 Mar 2022 16:38:57 +0800
Message-ID: <202203211653.zfxYHgJT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2655652896934429142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220318153432.3984b871@gandalf.local.home>
References: <20220318153432.3984b871@gandalf.local.home>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: LKML <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-ext4(a)vger.kernel.org
CC: Sven Schnelle <svens@linux.ibm.com>
CC: Ritesh Harjani <riteshh@linux.ibm.com>
CC: Jan Kara <jack@suse.cz>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Harshad Shirwadkar <harshadshirwadkar@gmail.com>

Hi Steven,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on ammarfaizi2-block/rostedt/linux-trace/for-next-=
core hnaz-mm/master next-20220318]
[cannot apply to linux/master linus/master v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Steven-Rostedt/tracing-Hav=
e-type-enum-modifications-copy-the-strings/20220319-033556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-m031-20220321 (https://download.01.org/0day-ci/a=
rchive/20220321/202203211653.zfxYHgJT-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events.c:2657 add_str_to_module() warn: possible memory =
leak of 'modstr'

vim +/modstr +2657 kernel/trace/trace_events.c

0c564a538aa934 Steven Rostedt (Red Hat  2015-03-24  2643) =

32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2644) static void add_s=
tr_to_module(struct module *module, char *str)
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2645) {
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2646) 	struct module_st=
ring *modstr;
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2647) =

32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2648) 	modstr =3D kmall=
oc(sizeof(*modstr), GFP_KERNEL);
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2649) =

32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2650) 	/*
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2651) 	 * If we failed =
to allocate memory here, then we'll just
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2652) 	 * let the str m=
emory leak when the module is removed.
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2653) 	 * If this fails=
 to allocate, there's worse problems than
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2654) 	 * a leaked stri=
ng on module removal.
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2655) 	 */
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2656) 	if (WARN_ON_ONCE=
(!modstr))
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18 @2657) 		return;
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2658) =

32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2659) 	modstr->module =
=3D module;
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2660) 	modstr->str =3D =
str;
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2661) =

32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2662) 	list_add(&modstr=
->next, &module_strings);
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2663) }
32f4c7cad6f15f Steven Rostedt (Google   2022-03-18  2664) =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2655652896934429142==--

