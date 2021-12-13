Content-Type: multipart/mixed; boundary="===============1776904714192679461=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] init/initramfs.c: check the return value of kstrdup()
Date: Tue, 14 Dec 2021 04:51:18 +0800
Message-ID: <202112140423.37WdeaEE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1776904714192679461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <tencent_B8A4989923779B6381A23A5C4209FD7F1E05@qq.com>
References: <tencent_B8A4989923779B6381A23A5C4209FD7F1E05@qq.com>
TO: Xiaoke Wang <xkernel.wang@foxmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: Xiaoke Wang <xkernel.wang@foxmail.com>

Hi Xiaoke,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xiaoke-Wang/init-initramfs=
-c-check-the-return-value-of-kstrdup/20211213-170026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20211213 (https://download.01.org/0day-ci/arch=
ive/20211214/202112140423.37WdeaEE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
init/initramfs.c:148 dir_add() error: dereferencing freed memory 'de'

Old smatch warnings:
init/initramfs.c:97 find_link() error: we previously assumed 'q' could be n=
ull (see line 95)
init/initramfs.c:142 dir_add() error: we previously assumed 'de' could be n=
ull (see line 140)

vim +/de +148 init/initramfs.c

889d51a10712b6 Nye Liu          2008-10-15  136  =

e35c4c64fe492b Arnd Bergmann    2017-11-17  137  static void __init dir_add=
(const char *name, time64_t mtime)
889d51a10712b6 Nye Liu          2008-10-15  138  {
889d51a10712b6 Nye Liu          2008-10-15  139  	struct dir_entry *de =3D =
kmalloc(sizeof(struct dir_entry), GFP_KERNEL);
889d51a10712b6 Nye Liu          2008-10-15  140  	if (!de)
dd23e8098f33a5 Florian Fainelli 2021-02-25  141  		panic_show_mem("can't al=
locate dir_entry buffer");
889d51a10712b6 Nye Liu          2008-10-15  142  	de->name =3D kstrdup(name=
, GFP_KERNEL);
764baf9ece4791 Xiaoke Wang      2021-12-13  143  	if (!de->name) {
764baf9ece4791 Xiaoke Wang      2021-12-13  144  		kfree(de);
764baf9ece4791 Xiaoke Wang      2021-12-13  145  		panic_show_mem("can't du=
plicate dir name");
764baf9ece4791 Xiaoke Wang      2021-12-13  146  	}
764baf9ece4791 Xiaoke Wang      2021-12-13  147  	INIT_LIST_HEAD(&de->list);
889d51a10712b6 Nye Liu          2008-10-15 @148  	de->mtime =3D mtime;
889d51a10712b6 Nye Liu          2008-10-15  149  	list_add(&de->list, &dir_=
list);
889d51a10712b6 Nye Liu          2008-10-15  150  }
889d51a10712b6 Nye Liu          2008-10-15  151  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1776904714192679461==--

