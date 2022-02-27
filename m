Content-Type: multipart/mixed; boundary="===============1397942718404636229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v2 91/159] crypto/dh_helper.c:32 get_safe_prime_group() warn: we never enter this loop
Date: Sun, 27 Feb 2022 08:00:18 +0800
Message-ID: <202202270749.hyb2lMHg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1397942718404636229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolai Stange <nstange@suse.de>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 tls-upcall.v2
head:   21b520ae0b338bd30496feb1ca90a2820dab7a65
commit: a1f704a055a26f2ac556826c01742bd7776b4a79 [91/159] crypto: dh - opti=
mize domain parameter serialization for well-known groups
:::::: branch date: 33 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20227/202202270749.hyb2lMHg-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
crypto/dh_helper.c:32 get_safe_prime_group() warn: we never enter this loop

vim +32 crypto/dh_helper.c

a1f704a055a26f Nicolai Stange      2021-12-01  26  =

a1f704a055a26f Nicolai Stange      2021-12-01  27  static inline const stru=
ct safe_prime_group *
a1f704a055a26f Nicolai Stange      2021-12-01  28  get_safe_prime_group(enu=
m dh_group_id group_id)
a1f704a055a26f Nicolai Stange      2021-12-01  29  {
a1f704a055a26f Nicolai Stange      2021-12-01  30  	int i;
a1f704a055a26f Nicolai Stange      2021-12-01  31  =

a1f704a055a26f Nicolai Stange      2021-12-01 @32  	for (i =3D 0; i < ARRAY=
_SIZE(safe_prime_groups); ++i) {
a1f704a055a26f Nicolai Stange      2021-12-01  33  		if (safe_prime_groups[=
i].group_id =3D=3D group_id)
a1f704a055a26f Nicolai Stange      2021-12-01  34  			return &safe_prime_gr=
oups[i];
a1f704a055a26f Nicolai Stange      2021-12-01  35  	}
a1f704a055a26f Nicolai Stange      2021-12-01  36  =

a1f704a055a26f Nicolai Stange      2021-12-01  37  	return NULL;
a1f704a055a26f Nicolai Stange      2021-12-01  38  }
802c7f1c84e4b5 Salvatore Benedetto 2016-06-22  39  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1397942718404636229==--

