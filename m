Content-Type: multipart/mixed; boundary="===============6863581182436804353=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v2 105/159] crypto/dh_helper.c:493 lookup_group_id() warn: we never enter this loop
Date: Sun, 27 Feb 2022 12:24:59 +0800
Message-ID: <202202271250.Un3Vj8lS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6863581182436804353==
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
commit: 4d99a44a7df0d3af973a9be175fbdaefe2bdc602 [105/159] crypto: dh - try=
 to match domain parameters to a known safe-prime group
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20227/202202271250.Un3Vj8lS-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
crypto/dh_helper.c:493 lookup_group_id() warn: we never enter this loop

Old smatch warnings:
crypto/dh_helper.c:466 get_safe_prime_group() warn: we never enter this loop

vim +493 crypto/dh_helper.c

802c7f1c84e4b5 Salvatore Benedetto 2016-06-22  473  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  474  static enum dh_group_id=
 lookup_group_id(const char *g, size_t g_size,
4d99a44a7df0d3 Nicolai Stange      2021-12-01  475  					const char *p, siz=
e_t p_size)
4d99a44a7df0d3 Nicolai Stange      2021-12-01  476  {
4d99a44a7df0d3 Nicolai Stange      2021-12-01  477  	int i;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  478  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  479  	/* All safe-prime grou=
ps use a generator of g =3D=3D 2. */
4d99a44a7df0d3 Nicolai Stange      2021-12-01  480  	while (g_size && !*g) {
4d99a44a7df0d3 Nicolai Stange      2021-12-01  481  		++g;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  482  		--g_size;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  483  	}
4d99a44a7df0d3 Nicolai Stange      2021-12-01  484  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  485  	if (g_size !=3D 1 || *=
g !=3D 2)
4d99a44a7df0d3 Nicolai Stange      2021-12-01  486  		return dh_group_id_un=
known;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  487  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  488  	while (p_size && !*p) {
4d99a44a7df0d3 Nicolai Stange      2021-12-01  489  		++p;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  490  		--p_size;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  491  	}
4d99a44a7df0d3 Nicolai Stange      2021-12-01  492  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01 @493  	for (i =3D 0; i < ARRA=
Y_SIZE(safe_prime_groups); ++i) {
4d99a44a7df0d3 Nicolai Stange      2021-12-01  494  		if (safe_prime_groups=
[i].p_size !=3D p_size)
4d99a44a7df0d3 Nicolai Stange      2021-12-01  495  			continue;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  496  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  497  		if (!memcmp(safe_prim=
e_groups[i].p, p, p_size))
4d99a44a7df0d3 Nicolai Stange      2021-12-01  498  			return safe_prime_gr=
oups[i].group_id;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  499  	}
4d99a44a7df0d3 Nicolai Stange      2021-12-01  500  =

4d99a44a7df0d3 Nicolai Stange      2021-12-01  501  	return dh_group_id_unk=
nown;
4d99a44a7df0d3 Nicolai Stange      2021-12-01  502  }
4d99a44a7df0d3 Nicolai Stange      2021-12-01  503  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6863581182436804353==--

