Content-Type: multipart/mixed; boundary="===============3523374861574076183=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [akpm-mm:mm-unstable 285/296] mm/zsmalloc.c:403:5-11: inconsistent IS_ERR and PTR_ERR on line 404.
Date: Mon, 18 Jul 2022 00:13:21 +0800
Message-ID: <202207180042.55fWPCSK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3523374861574076183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hui Zhu <teawater@antgroup.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unst=
able
head:   9eeb6536c5ab3fcc2f18bd2feb5220c48ede725e
commit: 638e10c184861245496499b87563499312fe974a [285/296] zsmalloc: zs_mal=
loc: return ERR_PTR on failure
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: microblaze-randconfig-c042-20220717 (https://download.01.org/0day-c=
i/archive/20220718/202207180042.55fWPCSK-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/zsmalloc.c:403:5-11: inconsistent IS_ERR and PTR_ERR on line 404.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3523374861574076183==--

