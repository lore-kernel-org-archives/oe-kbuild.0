Content-Type: multipart/mixed; boundary="===============7246362585543191502=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH v6 1/5] trace: Add trace any kernel object
Date: Sat, 04 Dec 2021 03:54:03 +0800
Message-ID: <202112040300.0gTw1WdI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7246362585543191502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129164951.220511-2-xiehuan09@gmail.com>
References: <20211129164951.220511-2-xiehuan09@gmail.com>
TO: Jeff Xie <xiehuan09@gmail.com>

Hi Jeff,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-202112=
03]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeff-Xie/trace-Introduce-o=
bjtrace-trigger-to-trace-the-kernel-object/20211130-041958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20211128 (https://download.01.org/0day-ci/arch=
ive/20211204/202112040300.0gTw1WdI-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_object.c:533 exit_trace_object() error: uninitialized sy=
mbol 'ret'.

vim +/ret +533 kernel/trace/trace_object.c

88ea43d691b098 Jeff Xie 2021-11-30  513  =

88ea43d691b098 Jeff Xie 2021-11-30  514  static int exit_trace_object(void)
88ea43d691b098 Jeff Xie 2021-11-30  515  {
88ea43d691b098 Jeff Xie 2021-11-30  516  	int ret;
88ea43d691b098 Jeff Xie 2021-11-30  517  =

88ea43d691b098 Jeff Xie 2021-11-30  518  	if (WARN_ON_ONCE(atomic_read(&tra=
ce_object_ref) <=3D 0))
88ea43d691b098 Jeff Xie 2021-11-30  519  		goto out;
88ea43d691b098 Jeff Xie 2021-11-30  520  =

88ea43d691b098 Jeff Xie 2021-11-30  521  	if (atomic_dec_return(&trace_obje=
ct_ref) !=3D 0) {
88ea43d691b098 Jeff Xie 2021-11-30  522  		ret =3D 0;
88ea43d691b098 Jeff Xie 2021-11-30  523  		goto out;
88ea43d691b098 Jeff Xie 2021-11-30  524  	}
88ea43d691b098 Jeff Xie 2021-11-30  525  =

88ea43d691b098 Jeff Xie 2021-11-30  526  	ret =3D unregister_ftrace_functio=
n(&trace_ops);
88ea43d691b098 Jeff Xie 2021-11-30  527  	if (ret) {
88ea43d691b098 Jeff Xie 2021-11-30  528  		pr_err("can't unregister ftrace =
for trace object\n");
88ea43d691b098 Jeff Xie 2021-11-30  529  		goto out;
88ea43d691b098 Jeff Xie 2021-11-30  530  	}
88ea43d691b098 Jeff Xie 2021-11-30  531  	free_object_pool();
88ea43d691b098 Jeff Xie 2021-11-30  532  out:
88ea43d691b098 Jeff Xie 2021-11-30 @533  	return ret;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7246362585543191502==--

