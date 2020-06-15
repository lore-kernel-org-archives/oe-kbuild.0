Content-Type: multipart/mixed; boundary="===============7243330396473964056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [brauner:ioctl_ns_get_init_pid 1/1] fs/nsfs.c:194:22: warning: Unused variable: child_reaper
Date: Mon, 15 Jun 2020 09:43:16 +0800
Message-ID: <202006150906.GObIY7qm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7243330396473964056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christian Brauner <christian.brauner@ubuntu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git i=
octl_ns_get_init_pid
head:   152518b0e355ba1bccb552ff3bce0f80bcc0ae6b
commit: 152518b0e355ba1bccb552ff3bce0f80bcc0ae6b [1/1] nsfs: add NS_GET_INI=
T_PID ioctl
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/nsfs.c:194:22: warning: Unused variable: child_reaper [unusedVariable]
    struct task_struct *child_reaper;
                        ^
>> fs/nsfs.c:195:14: warning: Unused variable: pid_struct [unusedVariable]
    struct pid *pid_struct;
                ^

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3D152518b0e355ba1bccb552ff3bce0f80bcc0ae6b
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout 152518b0e355ba1bccb552ff3bce0f80bcc0ae6b
vim +194 fs/nsfs.c

6786741dbf99e44 Andrey Vagin                2016-09-06  188  =

6786741dbf99e44 Andrey Vagin                2016-09-06  189  static long ns=
_ioctl(struct file *filp, unsigned int ioctl,
6786741dbf99e44 Andrey Vagin                2016-09-06  190  			unsigned lo=
ng arg)
6786741dbf99e44 Andrey Vagin                2016-09-06  191  {
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  192) 	struct user_n=
amespace *user_ns;
152518b0e355ba1 Christian Brauner           2020-06-07  193  	struct pid_na=
mespace *pid_ns;
152518b0e355ba1 Christian Brauner           2020-06-07 @194  	struct task_s=
truct *child_reaper;
152518b0e355ba1 Christian Brauner           2020-06-07 @195  	struct pid *p=
id_struct;
152518b0e355ba1 Christian Brauner           2020-06-07  196  	pid_t pid;
6786741dbf99e44 Andrey Vagin                2016-09-06  197  	struct ns_com=
mon *ns =3D get_proc_ns(file_inode(filp));
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  198) 	uid_t __user =
*argp;
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  199) 	uid_t uid;
6786741dbf99e44 Andrey Vagin                2016-09-06  200  =

6786741dbf99e44 Andrey Vagin                2016-09-06  201  	switch (ioctl=
) {
6786741dbf99e44 Andrey Vagin                2016-09-06  202  	case NS_GET_U=
SERNS:
6786741dbf99e44 Andrey Vagin                2016-09-06  203  		return open_=
related_ns(ns, ns_get_owner);
a7306ed8d94af72 Andrey Vagin                2016-09-06  204  	case NS_GET_P=
ARENT:
a7306ed8d94af72 Andrey Vagin                2016-09-06  205  		if (!ns->ops=
->get_parent)
a7306ed8d94af72 Andrey Vagin                2016-09-06  206  			return -EIN=
VAL;
a7306ed8d94af72 Andrey Vagin                2016-09-06  207  		return open_=
related_ns(ns, ns->ops->get_parent);
e5ff5ce6e20ee22 Michael Kerrisk (man-pages  2017-01-25  208) 	case NS_GET_N=
STYPE:
e5ff5ce6e20ee22 Michael Kerrisk (man-pages  2017-01-25  209) 		return ns->o=
ps->type;
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  210) 	case NS_GET_O=
WNER_UID:
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  211) 		if (ns->ops-=
>type !=3D CLONE_NEWUSER)
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  212) 			return -EIN=
VAL;
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  213) 		user_ns =3D =
container_of(ns, struct user_namespace, ns);
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  214) 		argp =3D (ui=
d_t __user *) arg;
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  215) 		uid =3D from=
_kuid_munged(current_user_ns(), user_ns->owner);
d95fa3c76a66b6d Michael Kerrisk (man-pages  2017-01-25  216) 		return put_u=
ser(uid, argp);
152518b0e355ba1 Christian Brauner           2020-06-07  217  	case NS_GET_I=
NIT_PID:
152518b0e355ba1 Christian Brauner           2020-06-07  218  		if (ns->ops-=
>type !=3D CLONE_NEWPID)
152518b0e355ba1 Christian Brauner           2020-06-07  219  			return -EIN=
VAL;
152518b0e355ba1 Christian Brauner           2020-06-07  220  =

152518b0e355ba1 Christian Brauner           2020-06-07  221  		pid_ns =3D c=
ontainer_of(ns, struct pid_namespace, ns);
152518b0e355ba1 Christian Brauner           2020-06-07  222  =

152518b0e355ba1 Christian Brauner           2020-06-07  223  		/*
152518b0e355ba1 Christian Brauner           2020-06-07  224  		 * If we're =
asking for the init pid of our own pid namespace
152518b0e355ba1 Christian Brauner           2020-06-07  225  		 * that's of=
 course silly but no need to fail this since we can
152518b0e355ba1 Christian Brauner           2020-06-07  226  		 * both infe=
r or find out our own pid namespaces's init pid
152518b0e355ba1 Christian Brauner           2020-06-07  227  		 * trivially=
. In all other cases, we require the same
152518b0e355ba1 Christian Brauner           2020-06-07  228  		 * privilege=
s as for setns().
152518b0e355ba1 Christian Brauner           2020-06-07  229  		 */
152518b0e355ba1 Christian Brauner           2020-06-07  230  		if (task_act=
ive_pid_ns(current) !=3D pid_ns &&
152518b0e355ba1 Christian Brauner           2020-06-07  231  		    !ns_capa=
ble(pid_ns->user_ns, CAP_SYS_ADMIN))
152518b0e355ba1 Christian Brauner           2020-06-07  232  			return -EPE=
RM;
152518b0e355ba1 Christian Brauner           2020-06-07  233  =

152518b0e355ba1 Christian Brauner           2020-06-07  234  		pid =3D -ESR=
CH;
152518b0e355ba1 Christian Brauner           2020-06-07  235  		read_lock(&t=
asklist_lock);
152518b0e355ba1 Christian Brauner           2020-06-07  236  		if (likely(p=
id_ns->child_reaper))
152518b0e355ba1 Christian Brauner           2020-06-07  237  			pid =3D tas=
k_pid_vnr(pid_ns->child_reaper);
152518b0e355ba1 Christian Brauner           2020-06-07  238  		read_unlock(=
&tasklist_lock);
152518b0e355ba1 Christian Brauner           2020-06-07  239  =

152518b0e355ba1 Christian Brauner           2020-06-07  240  		return pid;
6786741dbf99e44 Andrey Vagin                2016-09-06  241  	default:
6786741dbf99e44 Andrey Vagin                2016-09-06  242  		return -ENOT=
TY;
6786741dbf99e44 Andrey Vagin                2016-09-06  243  	}
6786741dbf99e44 Andrey Vagin                2016-09-06  244  }
6786741dbf99e44 Andrey Vagin                2016-09-06  245  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7243330396473964056==--

