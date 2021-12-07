Content-Type: multipart/mixed; boundary="===============4820136392016878047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 17/18] crypto: dh - try to match domain parameters to a known safe-prime group
Date: Tue, 07 Dec 2021 15:06:25 +0800
Message-ID: <202112071438.gJPtedGv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4820136392016878047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201004858.19831-18-nstange@suse.de>
References: <20211201004858.19831-18-nstange@suse.de>
TO: Nicolai Stange <nstange@suse.de>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
CC: "Stephan M=C3=BCller" <smueller@chronox.de>
CC: Hannes Reinecke <hare@suse.de>
CC: Torsten Duwe <duwe@suse.de>
CC: Zaibo Xu <xuzaibo@huawei.com>
CC: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: David Howells <dhowells@redhat.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

Hi Nicolai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master jmorris-=
security/next-testing v5.16-rc4 next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicolai-Stange/crypto-dh-i=
nfrastructure-for-NVM-in-band-auth-and-FIPS-conformance/20211201-085159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211207/202112071438.gJPtedGv-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
crypto/dh_helper.c:493 lookup_group_id() warn: we never enter this loop

Old smatch warnings:
crypto/dh_helper.c:466 get_safe_prime_group() warn: we never enter this loop

vim +493 crypto/dh_helper.c

802c7f1c84e4b5a Salvatore Benedetto 2016-06-22  473  =

2048fab14cfd860 Nicolai Stange      2021-12-01  474  static enum dh_group_i=
d lookup_group_id(const char *g, size_t g_size,
2048fab14cfd860 Nicolai Stange      2021-12-01  475  					const char *p, si=
ze_t p_size)
2048fab14cfd860 Nicolai Stange      2021-12-01  476  {
2048fab14cfd860 Nicolai Stange      2021-12-01  477  	int i;
2048fab14cfd860 Nicolai Stange      2021-12-01  478  =

2048fab14cfd860 Nicolai Stange      2021-12-01  479  	/* All safe-prime gro=
ups use a generator of g =3D=3D 2. */
2048fab14cfd860 Nicolai Stange      2021-12-01  480  	while (g_size && !*g)=
 {
2048fab14cfd860 Nicolai Stange      2021-12-01  481  		++g;
2048fab14cfd860 Nicolai Stange      2021-12-01  482  		--g_size;
2048fab14cfd860 Nicolai Stange      2021-12-01  483  	}
2048fab14cfd860 Nicolai Stange      2021-12-01  484  =

2048fab14cfd860 Nicolai Stange      2021-12-01  485  	if (g_size !=3D 1 || =
*g !=3D 2)
2048fab14cfd860 Nicolai Stange      2021-12-01  486  		return dh_group_id_u=
nknown;
2048fab14cfd860 Nicolai Stange      2021-12-01  487  =

2048fab14cfd860 Nicolai Stange      2021-12-01  488  	while (p_size && !*p)=
 {
2048fab14cfd860 Nicolai Stange      2021-12-01  489  		++p;
2048fab14cfd860 Nicolai Stange      2021-12-01  490  		--p_size;
2048fab14cfd860 Nicolai Stange      2021-12-01  491  	}
2048fab14cfd860 Nicolai Stange      2021-12-01  492  =

2048fab14cfd860 Nicolai Stange      2021-12-01 @493  	for (i =3D 0; i < ARR=
AY_SIZE(safe_prime_groups); ++i) {
2048fab14cfd860 Nicolai Stange      2021-12-01  494  		if (safe_prime_group=
s[i].p_size !=3D p_size)
2048fab14cfd860 Nicolai Stange      2021-12-01  495  			continue;
2048fab14cfd860 Nicolai Stange      2021-12-01  496  =

2048fab14cfd860 Nicolai Stange      2021-12-01  497  		if (!memcmp(safe_pri=
me_groups[i].p, p, p_size))
2048fab14cfd860 Nicolai Stange      2021-12-01  498  			return safe_prime_g=
roups[i].group_id;
2048fab14cfd860 Nicolai Stange      2021-12-01  499  	}
2048fab14cfd860 Nicolai Stange      2021-12-01  500  =

2048fab14cfd860 Nicolai Stange      2021-12-01  501  	return dh_group_id_un=
known;
2048fab14cfd860 Nicolai Stange      2021-12-01  502  }
2048fab14cfd860 Nicolai Stange      2021-12-01  503  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4820136392016878047==--

