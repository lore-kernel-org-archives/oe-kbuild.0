Content-Type: multipart/mixed; boundary="===============6232251296364517615=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [brauner:pidfd_capabilities 6/7] kernel/fork.c:2743 clone3_args_valid() warn: signedness bug returning '(-22)'
Date: Sat, 25 Jan 2020 09:55:24 +0300
Message-ID: <20200125065524.GG1870@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6232251296364517615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git p=
idfd_capabilities
head:   39f8e5a5a89ad52ff07fd5af7e514def2b527ed5
commit: aac4bbd536549cbb7440326d09a35ddf9c28f50b [6/7] pidfd: introduce caps

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/fork.c:2743 clone3_args_valid() warn: signedness bug returning '(-22=
)'
kernel/pid.c:621 __pidfd_fget() error: uninitialized symbol 'oldcred'.

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3Daac4bbd536549cbb7440326d09a35ddf9c28f50b
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout aac4bbd536549cbb7440326d09a35ddf9c28f50b
vim +2743 kernel/fork.c

fa729c4df55893 Christian Brauner 2019-10-31  2721  static bool clone3_args_=
valid(struct kernel_clone_args *kargs)
                                                          ^^^^

7f192e3cd316ba Christian Brauner 2019-05-25  2722  {
b612e5df4587c9 Christian Brauner 2019-10-14  2723  	/* Verify that no unkno=
wn flags are passed along. */
b612e5df4587c9 Christian Brauner 2019-10-14  2724  	if (kargs->flags & ~(CL=
ONE_LEGACY_FLAGS | CLONE_CLEAR_SIGHAND))
7f192e3cd316ba Christian Brauner 2019-05-25  2725  		return false;
7f192e3cd316ba Christian Brauner 2019-05-25  2726  =

7f192e3cd316ba Christian Brauner 2019-05-25  2727  	/*
7f192e3cd316ba Christian Brauner 2019-05-25  2728  	 * - make the CLONE_DET=
ACHED bit reuseable for clone3
7f192e3cd316ba Christian Brauner 2019-05-25  2729  	 * - make the CSIGNAL b=
its reuseable for clone3
7f192e3cd316ba Christian Brauner 2019-05-25  2730  	 */
7f192e3cd316ba Christian Brauner 2019-05-25  2731  	if (kargs->flags & (CLO=
NE_DETACHED | CSIGNAL))
7f192e3cd316ba Christian Brauner 2019-05-25  2732  		return false;
7f192e3cd316ba Christian Brauner 2019-05-25  2733  =

b612e5df4587c9 Christian Brauner 2019-10-14  2734  	if ((kargs->flags & (CL=
ONE_SIGHAND | CLONE_CLEAR_SIGHAND)) =3D=3D
b612e5df4587c9 Christian Brauner 2019-10-14  2735  	    (CLONE_SIGHAND | CL=
ONE_CLEAR_SIGHAND))
b612e5df4587c9 Christian Brauner 2019-10-14  2736  		return false;
b612e5df4587c9 Christian Brauner 2019-10-14  2737  =

7f192e3cd316ba Christian Brauner 2019-05-25  2738  	if ((kargs->flags & (CL=
ONE_THREAD | CLONE_PARENT)) &&
7f192e3cd316ba Christian Brauner 2019-05-25  2739  	    kargs->exit_signal)
7f192e3cd316ba Christian Brauner 2019-05-25  2740  		return false;
7f192e3cd316ba Christian Brauner 2019-05-25  2741  =

aac4bbd536549c Christian Brauner 2020-01-19  2742  	if (kargs->pidfd_flags =
& ~PIDFD_CAP_GETFD)
aac4bbd536549c Christian Brauner 2020-01-19 @2743  		return -EINVAL;
                                                                ^^^^^^^^^^^=
^^^

aac4bbd536549c Christian Brauner 2020-01-19  2744  =

aac4bbd536549c Christian Brauner 2020-01-19  2745  	if ((kargs->pidfd_flags=
 & PIDFD_CAP_GETFD) &&
aac4bbd536549c Christian Brauner 2020-01-19  2746  	    !ns_capable(current=
_user_ns(), CAP_SYS_PTRACE))
aac4bbd536549c Christian Brauner 2020-01-19  2747  		return -EPERM;
                                                                ^^^^^^^^^^^=
^^
This will return true which has security implications.

aac4bbd536549c Christian Brauner 2020-01-19  2748  =

fa729c4df55893 Christian Brauner 2019-10-31  2749  	if (!clone3_stack_valid=
(kargs))
fa729c4df55893 Christian Brauner 2019-10-31  2750  		return false;
fa729c4df55893 Christian Brauner 2019-10-31  2751  =

7f192e3cd316ba Christian Brauner 2019-05-25  2752  	return true;
7f192e3cd316ba Christian Brauner 2019-05-25  2753  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============6232251296364517615==--

