Content-Type: multipart/mixed; boundary="===============6935569504132978684=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ext3:fast_track 2/2] Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h': 866> /* 443 is reserved for quotactl_path */
Date: Tue, 15 Jun 2021 20:00:04 +0800
Message-ID: <202106151958.xhnAIAjJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6935569504132978684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git f=
ast_track
head:   8b1462b67f23da548f27b779a36b8ea75f5ef249
commit: 8b1462b67f23da548f27b779a36b8ea75f5ef249 [2/2] quota: finish disabl=
e quotactl_path syscall
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  866< #=
define __NR_quotactl_path 443
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version@'include/uapi/asm-generic/unistd.h':  867< _=
_SYSCALL(__NR_quotactl_path, sys_quotactl_path)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  866> /=
* 443 is reserved for quotactl_path */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6935569504132978684==--

