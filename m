Content-Type: multipart/mixed; boundary="===============6846989353849746254=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/soc-ops.c:461:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 23:41:25 +0800
Message-ID: <202202222354.ZlEAU0lX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6846989353849746254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: 7f3d90a3519680dfa23e750f80bfdefc0f5eda4a ASoC: ops: Fix stereo chan=
ge notifications in snd_soc_put_volsw_sx()
date:   3 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202222354.ZlEAU0lX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7f3d90a3519680dfa23e750f80bfdefc0f5eda4a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7f3d90a3519680dfa23e750f80bfdefc0f5eda4a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                     ^        ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/btrfs/extent_map.c:615:3: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   fs/btrfs/extent_map.c:615:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/tuners/fc0011.c:252:3: warning: Value stored to 'bandwidth=
' is never read [clang-analyzer-deadcode.DeadStores]
                   bandwidth =3D 6000;
                   ^           ~~~~
   drivers/media/tuners/fc0011.c:252:3: note: Value stored to 'bandwidth' i=
s never read
                   bandwidth =3D 6000;
                   ^           ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ntfs3/inode.c:372:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/ntfs3/inode.c:372:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/ntfs3/index.c:2463:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2463:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2465:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2465:3: note: Value stored to 'err' is never read
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> sound/soc/soc-ops.c:461:4: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ret =3D err;
                           ^     ~~~
   sound/soc/soc-ops.c:461:4: note: Value stored to 'ret' is never read
                           ret =3D err;
                           ^     ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/nfs/nfs4state.c:2635:4: warning: Value stored to 'section' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           section =3D "detect expired delegations";
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4state.c:2635:4: note: Value stored to 'section' is never read
                           section =3D "detect expired delegations";
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   10 warnings generated.
   15 warnings generated.
   20 warnings generated.
   25 warnings generated.
   30 warnings generated.
   35 warnings generated.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mtd/mtdconcat.c:67:4: warning: Value stored to 'size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:67:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mtd/mtdchar.c:1176:19: warning: Value stored to 'map' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct map_info *map =3D mtd->priv;
                            ^~~   ~~~~~~~~~
   drivers/mtd/mtdchar.c:1176:19: note: Value stored to 'map' during its in=
itialization is never read
           struct map_info *map =3D mtd->priv;
                            ^~~   ~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/ipv4/tcp_timer.c:484:21: warning: Value stored to 'inet' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct inet_sock *inet =3D inet_sk(sk);
                                     ^~~~   ~~~~~~~~~~~
   net/ipv4/tcp_timer.c:484:21: note: Value stored to 'inet' during its ini=
tialization is never read

vim +/ret +461 sound/soc/soc-ops.c

7077148fb50a12 Mark Brown        2014-10-28  405  =

7077148fb50a12 Mark Brown        2014-10-28  406  /**
7077148fb50a12 Mark Brown        2014-10-28  407   * snd_soc_put_volsw_sx -=
 double mixer set callback
7077148fb50a12 Mark Brown        2014-10-28  408   * @kcontrol: mixer contr=
ol
9a11ef7ff00e08 Randy Dunlap      2015-11-23  409   * @ucontrol: control ele=
ment information
7077148fb50a12 Mark Brown        2014-10-28  410   *
7077148fb50a12 Mark Brown        2014-10-28  411   * Callback to set the va=
lue of a double mixer control that spans 2 registers.
7077148fb50a12 Mark Brown        2014-10-28  412   *
7077148fb50a12 Mark Brown        2014-10-28  413   * Returns 0 for success.
7077148fb50a12 Mark Brown        2014-10-28  414   */
7077148fb50a12 Mark Brown        2014-10-28  415  int snd_soc_put_volsw_sx(=
struct snd_kcontrol *kcontrol,
7077148fb50a12 Mark Brown        2014-10-28  416  			 struct snd_ctl_elem_v=
alue *ucontrol)
7077148fb50a12 Mark Brown        2014-10-28  417  {
7077148fb50a12 Mark Brown        2014-10-28  418  	struct snd_soc_component=
 *component =3D snd_kcontrol_chip(kcontrol);
7077148fb50a12 Mark Brown        2014-10-28  419  	struct soc_mixer_control=
 *mc =3D
7077148fb50a12 Mark Brown        2014-10-28  420  	    (struct soc_mixer_co=
ntrol *)kcontrol->private_value;
7077148fb50a12 Mark Brown        2014-10-28  421  =

7077148fb50a12 Mark Brown        2014-10-28  422  	unsigned int reg =3D mc-=
>reg;
7077148fb50a12 Mark Brown        2014-10-28  423  	unsigned int reg2 =3D mc=
->rreg;
7077148fb50a12 Mark Brown        2014-10-28  424  	unsigned int shift =3D m=
c->shift;
7077148fb50a12 Mark Brown        2014-10-28  425  	unsigned int rshift =3D =
mc->rshift;
7077148fb50a12 Mark Brown        2014-10-28  426  	int max =3D mc->max;
7077148fb50a12 Mark Brown        2014-10-28  427  	int min =3D mc->min;
ae7d1247d8673e Rohit kumar       2018-09-11  428  	unsigned int mask =3D (1=
U << (fls(min + max) - 1)) - 1;
7077148fb50a12 Mark Brown        2014-10-28  429  	int err =3D 0;
7f3d90a3519680 Mark Brown        2022-02-01  430  	int ret;
58f42dfd797759 Kuninori Morimoto 2021-08-03  431  	unsigned int val, val_ma=
sk;
7077148fb50a12 Mark Brown        2014-10-28  432  =

1601033da2dd20 Mark Brown        2022-01-28  433  	if (ucontrol->value.inte=
ger.value[0] < 0)
1601033da2dd20 Mark Brown        2022-01-28  434  		return -EINVAL;
4f1e50d6a9cf9c Mark Brown        2022-01-24  435  	val =3D ucontrol->value.=
integer.value[0];
4f1e50d6a9cf9c Mark Brown        2022-01-24  436  	if (mc->platform_max && =
val > mc->platform_max)
4f1e50d6a9cf9c Mark Brown        2022-01-24  437  		return -EINVAL;
4f1e50d6a9cf9c Mark Brown        2022-01-24  438  	if (val > max - min)
4f1e50d6a9cf9c Mark Brown        2022-01-24  439  		return -EINVAL;
7077148fb50a12 Mark Brown        2014-10-28  440  	val_mask =3D mask << shi=
ft;
4f1e50d6a9cf9c Mark Brown        2022-01-24  441  	val =3D (val + min) & ma=
sk;
7077148fb50a12 Mark Brown        2014-10-28  442  	val =3D val << shift;
7077148fb50a12 Mark Brown        2014-10-28  443  =

7077148fb50a12 Mark Brown        2014-10-28  444  	err =3D snd_soc_componen=
t_update_bits(component, reg, val_mask, val);
7077148fb50a12 Mark Brown        2014-10-28  445  	if (err < 0)
7077148fb50a12 Mark Brown        2014-10-28  446  		return err;
7f3d90a3519680 Mark Brown        2022-02-01  447  	ret =3D err;
7077148fb50a12 Mark Brown        2014-10-28  448  =

7077148fb50a12 Mark Brown        2014-10-28  449  	if (snd_soc_volsw_is_ste=
reo(mc)) {
58f42dfd797759 Kuninori Morimoto 2021-08-03  450  		unsigned int val2;
58f42dfd797759 Kuninori Morimoto 2021-08-03  451  =

7077148fb50a12 Mark Brown        2014-10-28  452  		val_mask =3D mask << rs=
hift;
7077148fb50a12 Mark Brown        2014-10-28  453  		val2 =3D (ucontrol->val=
ue.integer.value[1] + min) & mask;
7077148fb50a12 Mark Brown        2014-10-28  454  		val2 =3D val2 << rshift;
7077148fb50a12 Mark Brown        2014-10-28  455  =

7077148fb50a12 Mark Brown        2014-10-28  456  		err =3D snd_soc_compone=
nt_update_bits(component, reg2, val_mask,
7077148fb50a12 Mark Brown        2014-10-28  457  			val2);
7f3d90a3519680 Mark Brown        2022-02-01  458  =

7f3d90a3519680 Mark Brown        2022-02-01  459  		/* Don't discard any er=
ror code or drop change flag */
7f3d90a3519680 Mark Brown        2022-02-01  460  		if (ret =3D=3D 0 || err=
 < 0) {
7f3d90a3519680 Mark Brown        2022-02-01 @461  			ret =3D err;
7f3d90a3519680 Mark Brown        2022-02-01  462  		}
7077148fb50a12 Mark Brown        2014-10-28  463  	}
7077148fb50a12 Mark Brown        2014-10-28  464  	return err;
7077148fb50a12 Mark Brown        2014-10-28  465  }
7077148fb50a12 Mark Brown        2014-10-28  466  EXPORT_SYMBOL_GPL(snd_soc=
_put_volsw_sx);
7077148fb50a12 Mark Brown        2014-10-28  467  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6846989353849746254==--

