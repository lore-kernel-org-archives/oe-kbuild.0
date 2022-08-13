Content-Type: multipart/mixed; boundary="===============3884491495814383655=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_events_user.c:915 user_events_ioctl_reg() warn: ignoring unreachable code.
Date: Sun, 14 Aug 2022 00:53:16 +0800
Message-ID: <202208140059.vhQLZ689-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3884491495814383655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Beau Belgrave <beaub@linux.microsoft.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: 7f5a08c79df35e68f1a43033450c5050f12bc155 user_events: Add minimal s=
upport for trace_event into ftrace
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220814/202208140059.vhQLZ689-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_user.c:915 user_events_ioctl_reg() warn: ignoring=
 unreachable code.

vim +915 kernel/trace/trace_events_user.c

7f5a08c79df35e Beau Belgrave 2022-01-18  877  =

7f5a08c79df35e Beau Belgrave 2022-01-18  878  /*
7f5a08c79df35e Beau Belgrave 2022-01-18  879   * Registers a user_event on =
behalf of a user process.
7f5a08c79df35e Beau Belgrave 2022-01-18  880   */
7f5a08c79df35e Beau Belgrave 2022-01-18  881  static long user_events_ioctl=
_reg(struct file *file, unsigned long uarg)
7f5a08c79df35e Beau Belgrave 2022-01-18  882  {
7f5a08c79df35e Beau Belgrave 2022-01-18  883  	struct user_reg __user *ureg=
 =3D (struct user_reg __user *)uarg;
7f5a08c79df35e Beau Belgrave 2022-01-18  884  	struct user_reg reg;
7f5a08c79df35e Beau Belgrave 2022-01-18  885  	struct user_event *user;
7f5a08c79df35e Beau Belgrave 2022-01-18  886  	char *name;
7f5a08c79df35e Beau Belgrave 2022-01-18  887  	long ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  888  =

7f5a08c79df35e Beau Belgrave 2022-01-18  889  	ret =3D user_reg_get(ureg, &=
reg);
7f5a08c79df35e Beau Belgrave 2022-01-18  890  =

7f5a08c79df35e Beau Belgrave 2022-01-18  891  	if (ret)
7f5a08c79df35e Beau Belgrave 2022-01-18  892  		return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  893  =

7f5a08c79df35e Beau Belgrave 2022-01-18  894  	name =3D strndup_user((const=
 char __user *)(uintptr_t)reg.name_args,
7f5a08c79df35e Beau Belgrave 2022-01-18  895  			    MAX_EVENT_DESC);
7f5a08c79df35e Beau Belgrave 2022-01-18  896  =

7f5a08c79df35e Beau Belgrave 2022-01-18  897  	if (IS_ERR(name)) {
7f5a08c79df35e Beau Belgrave 2022-01-18  898  		ret =3D PTR_ERR(name);
7f5a08c79df35e Beau Belgrave 2022-01-18  899  		return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  900  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  901  =

7f5a08c79df35e Beau Belgrave 2022-01-18  902  	ret =3D user_event_parse_cmd=
(name, &user);
7f5a08c79df35e Beau Belgrave 2022-01-18  903  =

7f5a08c79df35e Beau Belgrave 2022-01-18  904  	if (ret) {
7f5a08c79df35e Beau Belgrave 2022-01-18  905  		kfree(name);
7f5a08c79df35e Beau Belgrave 2022-01-18  906  		return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  907  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  908  =

7f5a08c79df35e Beau Belgrave 2022-01-18  909  	ret =3D user_events_ref_add(=
file, user);
7f5a08c79df35e Beau Belgrave 2022-01-18  910  =

7f5a08c79df35e Beau Belgrave 2022-01-18  911  	/* Positive number is index =
and valid */
7f5a08c79df35e Beau Belgrave 2022-01-18  912  	if (ret < 0)
7f5a08c79df35e Beau Belgrave 2022-01-18  913  		return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  914  =

7f5a08c79df35e Beau Belgrave 2022-01-18 @915  	put_user((u32)ret, &ureg->wr=
ite_index);
7f5a08c79df35e Beau Belgrave 2022-01-18  916  	put_user(user->index, &ureg-=
>status_index);
7f5a08c79df35e Beau Belgrave 2022-01-18  917  =

7f5a08c79df35e Beau Belgrave 2022-01-18  918  	return 0;
7f5a08c79df35e Beau Belgrave 2022-01-18  919  }
7f5a08c79df35e Beau Belgrave 2022-01-18  920  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3884491495814383655==--

