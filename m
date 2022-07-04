Content-Type: multipart/mixed; boundary="===============1914825810919565815=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ttm/ttm_pool.c:162:70: warning: Parameter 'last' can be declared with const [constParameter]
Date: Mon, 04 Jul 2022 12:14:41 +0800
Message-ID: <202207041242.StNGlTMd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1914825810919565815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/ttm/ttm_pool.c:162:70: warning: Parameter 'last' can be de=
clared with const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88084a3df1672e131ddc1b4e39eeacfd39864acf
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a18b14d8886614b3c7d290c4cfc33389822b0535
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/ttm/ttm_pool.c:162:70: warning: Parameter 'last' can be =
declared with const [constParameter]
   static int ttm_pool_apply_caching(struct page **first, struct page **las=
t,
                                                                        ^
--
>> drivers/firmware/efi/efi.c:115:44: warning: Parameter 'kobj' can be decl=
ared with const [constParameter]
   static ssize_t systab_show(struct kobject *kobj,
                                              ^
--
>> drivers/md/bcache/btree.c:2614:7: warning: Syntax Error: AST broken, 'bu=
f' doesn't have a parent. [internalAstError]
     w =3D array_alloc(&buf->freelist);
         ^

vim +/last +162 drivers/gpu/drm/ttm/ttm_pool.c

d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  160  =

d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  161  /* Apply a new cachin=
g to an array of pages */
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22 @162  static int ttm_pool_a=
pply_caching(struct page **first, struct page **last,
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  163  				  enum ttm_cachin=
g caching)
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  164  {
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  165  #ifdef CONFIG_X86
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  166  	unsigned int num_pag=
es =3D last - first;
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  167  =

d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  168  	if (!num_pages)
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  169  		return 0;
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  170  =

d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  171  	switch (caching) {
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  172  	case ttm_cached:
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  173  		break;
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  174  	case ttm_write_combi=
ned:
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  175  		return set_pages_ar=
ray_wc(first, num_pages);
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  176  	case ttm_uncached:
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  177  		return set_pages_ar=
ray_uc(first, num_pages);
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  178  	}
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  179  #endif
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  180  	return 0;
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  181  }
d099fc8f540add8 Christian K=C3=B6nig 2020-10-22  182  =


:::::: The code at line 162 was first introduced by commit
:::::: d099fc8f540add80f725014fdd4f7f49f3c58911 drm/ttm: new TT backend all=
ocation pool v3

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1914825810919565815==--

