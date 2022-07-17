Content-Type: multipart/mixed; boundary="===============3129580819532662876=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [akpm-mm:mm-unstable 30/296] lib/maple_tree.c:6969:26: sparse: sparse: dubious: !x & y
Date: Sun, 17 Jul 2022 23:02:06 +0800
Message-ID: <202207172323.2KGEZlGk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3129580819532662876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/maple=
_tree.c:6969:26: sparse: sparse: dubious: !x & y"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Lukas Bulwahn <lukas.bulwahn@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unst=
able
head:   9eeb6536c5ab3fcc2f18bd2feb5220c48ede725e
commit: 3e7c1c1242fb316f6c1034e82827aaaefda4cc2f [30/296] Maple Tree: add n=
ew data structure
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: mips-randconfig-s053-20220717 (https://download.01.org/0day-ci/arch=
ive/20220717/202207172323.2KGEZlGk-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commi=
t/?id=3D3e7c1c1242fb316f6c1034e82827aaaefda4cc2f
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/=
git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 3e7c1c1242fb316f6c1034e82827aaaefda4cc2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:6969:26: sparse: sparse: dubious: !x & y

vim +6969 lib/maple_tree.c

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6948  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6949  /*
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6950   * Validate all pivots ar=
e within mas->min and mas->max.
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6951   */
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6952  static void mas_validate_=
limits(struct ma_state *mas)
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6953  {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6954  	int i;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6955  	unsigned long prev_piv =
=3D 0;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6956  	enum maple_type type =3D=
 mte_node_type(mas->node);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6957  	void __rcu **slots =3D m=
a_slots(mte_to_node(mas->node), type);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6958  	unsigned long *pivots =
=3D ma_pivots(mas_mn(mas), type);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6959  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6960  	/* all limits are fine h=
ere. */
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6961  	if (mte_is_root(mas->nod=
e))
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6962  		return;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6963  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6964  	for (i =3D 0; i < mt_slo=
ts[type]; i++) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6965  		unsigned long piv;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6966  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6967  		piv =3D mas_safe_pivot(=
mas, pivots, i, type);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6968  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17 @6969  		if (!piv & (i !=3D 0))
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6970  			break;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6971  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6972  		if (!mte_is_leaf(mas->n=
ode)) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6973  			void *entry =3D mas_sl=
ot(mas, slots, i);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6974  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6975  			if (!entry)
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6976  				pr_err("%p[%u] cannot=
 be null\n",
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6977  				       mas_mn(mas), i=
);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6978  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6979  			MT_BUG_ON(mas->tree, !=
entry);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6980  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6981  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6982  		if (prev_piv > piv) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6983  			pr_err("%p[%u] piv %lu=
 < prev_piv %lu\n",
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6984  				mas_mn(mas), i, piv, =
prev_piv);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6985  			MT_BUG_ON(mas->tree, p=
iv < prev_piv);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6986  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6987  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6988  		if (piv < mas->min) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6989  			pr_err("%p[%u] %lu < %=
lu\n", mas_mn(mas), i,
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6990  				piv, mas->min);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6991  			MT_BUG_ON(mas->tree, p=
iv < mas->min);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6992  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6993  		if (piv > mas->max) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6994  			pr_err("%p[%u] %lu > %=
lu\n", mas_mn(mas), i,
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6995  				piv, mas->max);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6996  			MT_BUG_ON(mas->tree, p=
iv > mas->max);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6997  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6998  		prev_piv =3D piv;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  6999  		if (piv =3D=3D mas->max)
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7000  			break;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7001  	}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7002  	for (i +=3D 1; i < mt_sl=
ots[type]; i++) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7003  		void *entry =3D mas_slo=
t(mas, slots, i);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7004  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7005  		if (entry && (i !=3D mt=
_slots[type] - 1)) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7006  			pr_err("%p[%u] should =
not have entry %p\n", mas_mn(mas),
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7007  			       i, entry);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7008  			MT_BUG_ON(mas->tree, e=
ntry !=3D NULL);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7009  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7010  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7011  		if (i < mt_pivots[type]=
) {
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7012  			unsigned long piv =3D =
pivots[i];
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7013  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7014  			if (!piv)
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7015  				continue;
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7016  =

3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7017  			pr_err("%p[%u] should =
not have piv %lu\n",
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7018  			       mas_mn(mas), i,=
 piv);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7019  			MT_BUG_ON(mas->tree, i=
 < mt_pivots[type] - 1);
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7020  		}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7021  	}
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7022  }
3e7c1c1242fb316 Liam R. Howlett 2022-07-17  7023  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3129580819532662876==--

