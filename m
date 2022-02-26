Content-Type: multipart/mixed; boundary="===============8455624662148987560=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/debug/kdb/kdb_main.c:806:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Sun, 27 Feb 2022 03:13:29 +0800
Message-ID: <202202262152.03y50pTo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8455624662148987560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sumit Garg <sumit.garg@linaro.org>
CC: Daniel Thompson <daniel.thompson@linaro.org>
CC: Douglas Anderson <dianders@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 9a5db530aa7d98b10c4f5104027565c98cca49e6 kdb: Simplify kdb_defcmd m=
acro logic
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/debug/kdb/kdb_main.c:806:3: warning: Assignment of function param=
eter has no effect outside the function. Did you forget dereferencing it? [=
uselessAssignmentPtrArg]
     argv =3D NULL;
     ^

vim +806 kernel/debug/kdb/kdb_main.c

5d5314d6795f3c Jason Wessel 2010-05-20  772  =

5d5314d6795f3c Jason Wessel 2010-05-20  773  /*
5d5314d6795f3c Jason Wessel 2010-05-20  774   * kdb_exec_defcmd - Execute t=
he set of commands associated with this
5d5314d6795f3c Jason Wessel 2010-05-20  775   *	defcmd name.
5d5314d6795f3c Jason Wessel 2010-05-20  776   * Inputs:
5d5314d6795f3c Jason Wessel 2010-05-20  777   *	argc	argument count
5d5314d6795f3c Jason Wessel 2010-05-20  778   *	argv	argument vector
5d5314d6795f3c Jason Wessel 2010-05-20  779   * Returns:
5d5314d6795f3c Jason Wessel 2010-05-20  780   *	zero for success, a kdb dia=
gnostic if error
5d5314d6795f3c Jason Wessel 2010-05-20  781   */
5d5314d6795f3c Jason Wessel 2010-05-20  782  static int kdb_exec_defcmd(int=
 argc, const char **argv)
5d5314d6795f3c Jason Wessel 2010-05-20  783  {
9a5db530aa7d98 Sumit Garg   2021-07-12  784  	int ret;
9a5db530aa7d98 Sumit Garg   2021-07-12  785  	kdbtab_t *kp;
9a5db530aa7d98 Sumit Garg   2021-07-12  786  	struct kdb_macro *kmp;
9a5db530aa7d98 Sumit Garg   2021-07-12  787  	struct kdb_macro_statement *k=
ms;
9a5db530aa7d98 Sumit Garg   2021-07-12  788  =

5d5314d6795f3c Jason Wessel 2010-05-20  789  	if (argc !=3D 0)
5d5314d6795f3c Jason Wessel 2010-05-20  790  		return KDB_ARGCOUNT;
9a5db530aa7d98 Sumit Garg   2021-07-12  791  =

9a5db530aa7d98 Sumit Garg   2021-07-12  792  	list_for_each_entry(kp, &kdb_=
cmds_head, list_node) {
9a5db530aa7d98 Sumit Garg   2021-07-12  793  		if (strcmp(kp->cmd_name, arg=
v[0]) =3D=3D 0)
5d5314d6795f3c Jason Wessel 2010-05-20  794  			break;
5d5314d6795f3c Jason Wessel 2010-05-20  795  	}
9a5db530aa7d98 Sumit Garg   2021-07-12  796  	if (list_entry_is_head(kp, &k=
db_cmds_head, list_node)) {
5d5314d6795f3c Jason Wessel 2010-05-20  797  		kdb_printf("kdb_exec_defcmd:=
 could not find commands for %s\n",
5d5314d6795f3c Jason Wessel 2010-05-20  798  			   argv[0]);
5d5314d6795f3c Jason Wessel 2010-05-20  799  		return KDB_NOTIMP;
5d5314d6795f3c Jason Wessel 2010-05-20  800  	}
9a5db530aa7d98 Sumit Garg   2021-07-12  801  	kmp =3D container_of(kp, stru=
ct kdb_macro, cmd);
9a5db530aa7d98 Sumit Garg   2021-07-12  802  	list_for_each_entry(kms, &kmp=
->statements, list_node) {
9a5db530aa7d98 Sumit Garg   2021-07-12  803  		/*
9a5db530aa7d98 Sumit Garg   2021-07-12  804  		 * Recursive use of kdb_pars=
e, do not use argv after this point.
9a5db530aa7d98 Sumit Garg   2021-07-12  805  		 */
5d5314d6795f3c Jason Wessel 2010-05-20 @806  		argv =3D NULL;
9a5db530aa7d98 Sumit Garg   2021-07-12  807  		kdb_printf("[%s]kdb> %s\n", =
kmp->cmd.cmd_name, kms->statement);
9a5db530aa7d98 Sumit Garg   2021-07-12  808  		ret =3D kdb_parse(kms->state=
ment);
5d5314d6795f3c Jason Wessel 2010-05-20  809  		if (ret)
5d5314d6795f3c Jason Wessel 2010-05-20  810  			return ret;
5d5314d6795f3c Jason Wessel 2010-05-20  811  	}
5d5314d6795f3c Jason Wessel 2010-05-20  812  	return 0;
5d5314d6795f3c Jason Wessel 2010-05-20  813  }
5d5314d6795f3c Jason Wessel 2010-05-20  814  =


:::::: The code at line 806 was first introduced by commit
:::::: 5d5314d6795f3c1c0f415348ff8c51f7de042b77 kdb: core for kgdb back end=
 (1 of 2)

:::::: TO: Jason Wessel <jason.wessel@windriver.com>
:::::: CC: Jason Wessel <jason.wessel@windriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8455624662148987560==--

