Content-Type: multipart/mixed; boundary="===============8988010779920863789=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] regmap: debugfs: Free the previous allocated debugfs_name buffer
Date: Sun, 09 Jan 2022 15:51:27 +0800
Message-ID: <202201091558.ITRbIvGW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8988010779920863789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220106171537.3091643-1-festevam@gmail.com>
References: <20220106171537.3091643-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: broonie(a)kernel.org
CC: matthias.schiffer(a)ew.tq-group.com
CC: linux-kernel(a)vger.kernel.org
CC: Fabio Estevam <festevam@gmail.com>

Hi Fabio,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-regmap/for-next]
[also build test WARNING on v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Fabio-Estevam/regmap-debug=
fs-Free-the-previous-allocated-debugfs_name-buffer/20220107-011724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git =
for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220107 (https://download.01.org/0day-ci/archi=
ve/20220109/202201091558.ITRbIvGW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/7de11921ba557466d696129b8=
cdc0a6176e763f1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Fabio-Estevam/regmap-debugfs-Free-=
the-previous-allocated-debugfs_name-buffer/20220107-011724
        git checkout 7de11921ba557466d696129b8cdc0a6176e763f1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireguard/device.c:145:15: note: Assuming 'family' is equal =
to 2
           if (unlikely(family !=3D AF_INET && family !=3D AF_INET6)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireguard/device.c:145:33: note: Left side of '&&' is false
           if (unlikely(family !=3D AF_INET && family !=3D AF_INET6)) {
                                          ^
   drivers/net/wireguard/device.c:145:2: note: Taking false branch
           if (unlikely(family !=3D AF_INET && family !=3D AF_INET6)) {
           ^
   drivers/net/wireguard/device.c:152:8: note: Assuming the condition is fa=
lse
           mtu =3D skb_dst(skb) ? dst_mtu(skb_dst(skb)) : dev->mtu;
                 ^~~~~~~~~~~~
   drivers/net/wireguard/device.c:152:8: note: '?' condition is false
   drivers/net/wireguard/device.c:154:2: note: Calling '__skb_queue_head_in=
it'
           __skb_queue_head_init(&packets);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireguard/device.c:154:2: note: Returning from '__skb_queue_=
head_init'
           __skb_queue_head_init(&packets);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireguard/device.c:155:6: note: Assuming the condition is tr=
ue
           if (!skb_is_gso(skb)) {
               ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/device.c:155:2: note: Taking true branch
           if (!skb_is_gso(skb)) {
           ^
   drivers/net/wireguard/device.c:168:26: note: 'skb' is non-null
           skb_list_walk_safe(skb, skb, next) {
                                   ^
   include/linux/skbuff.h:1559:38: note: expanded from macro 'skb_list_walk=
_safe'
           for ((skb) =3D (first), (next_skb) =3D (skb) ? (skb)->next : NUL=
L; (skb);  \
                                               ^~~
   drivers/net/wireguard/device.c:168:2: note: '?' condition is true
           skb_list_walk_safe(skb, skb, next) {
           ^
   include/linux/skbuff.h:1559:37: note: expanded from macro 'skb_list_walk=
_safe'
           for ((skb) =3D (first), (next_skb) =3D (skb) ? (skb)->next : NUL=
L; (skb);  \
                                              ^
   drivers/net/wireguard/device.c:168:2: note: Loop condition is true.  Ent=
ering loop body
           skb_list_walk_safe(skb, skb, next) {
           ^
   include/linux/skbuff.h:1559:2: note: expanded from macro 'skb_list_walk_=
safe'
           for ((skb) =3D (first), (next_skb) =3D (skb) ? (skb)->next : NUL=
L; (skb);  \
           ^
   drivers/net/wireguard/device.c:172:17: note: 'skb' is non-null
                   if (unlikely(!skb))
                                 ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireguard/device.c:172:3: note: Taking false branch
                   if (unlikely(!skb))
                   ^
   drivers/net/wireguard/device.c:182:3: note: Calling '__skb_queue_tail'
                   __skb_queue_tail(&packets, skb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2118:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2085:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
   1 warning generated.
   drivers/base/regmap/regcache.c:137:7: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:6: note: Assuming field 'cache_type' =
is not equal to REGCACHE_NONE
           if (map->cache_type =3D=3D REGCACHE_NONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:2: note: Taking false branch
           if (map->cache_type =3D=3D REGCACHE_NONE) {
           ^
   drivers/base/regmap/regcache.c:130:6: note: Assuming field 'reg_defaults=
' is null
           if (config->reg_defaults && !config->num_reg_defaults) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:130:27: note: Left side of '&&' is false
           if (config->reg_defaults && !config->num_reg_defaults) {
                                    ^
   drivers/base/regmap/regcache.c:136:14: note: Assuming 'i' is < field 'nu=
m_reg_defaults'
           for (i =3D 0; i < config->num_reg_defaults; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:136:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < config->num_reg_defaults; i++)
           ^
   drivers/base/regmap/regcache.c:137:7: note: Dereference of null pointer
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
>> drivers/base/regmap/regmap-debugfs.c:597:7: warning: Use of memory after=
 it is freed [clang-analyzer-unix.Malloc]
           if (!strcmp(name, "dummy")) {
                ^
   drivers/base/regmap/regmap-debugfs.c:688:2: note: Loop condition is true=
.  Entering loop body
           list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, =
link) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/base/regmap/regmap-debugfs.c:689:3: note: Calling 'regmap_debugf=
s_init'
                   regmap_debugfs_init(node->map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:560:6: note: Assuming field 'debugf=
s_disable' is false
           if (map->debugfs_disable) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:560:2: note: Taking false branch
           if (map->debugfs_disable) {
           ^
   drivers/base/regmap/regmap-debugfs.c:566:6: note: Assuming 'regmap_debug=
fs_root' is non-null
           if (!regmap_debugfs_root) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:566:2: note: Taking false branch
           if (!regmap_debugfs_root) {
           ^
   drivers/base/regmap/regmap-debugfs.c:579:2: note: Loop condition is fals=
e.  Exiting loop
           mutex_init(&map->cache_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/base/regmap/regmap-debugfs.c:581:6: note: Assuming field 'dev' i=
s null
           if (map->dev)
               ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:581:2: note: Taking false branch
           if (map->dev)
           ^
   drivers/base/regmap/regmap-debugfs.c:584:6: note: Assuming 'name' is non=
-null
           if (name) {
               ^~~~
   drivers/base/regmap/regmap-debugfs.c:584:2: note: Taking true branch
           if (name) {
           ^
   drivers/base/regmap/regmap-debugfs.c:585:7: note: Assuming field 'debugf=
s_name' is non-null
                   if (!map->debugfs_name) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:585:3: note: Taking false branch
                   if (!map->debugfs_name) {
                   ^
   drivers/base/regmap/regmap-debugfs.c:592:3: note: Memory is released
                   kfree(map->debugfs_name);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:597:7: note: Use of memory after it=
 is freed
           if (!strcmp(name, "dummy")) {
                ^      ~~~~
   drivers/base/regmap/regmap-debugfs.c:608:17: warning: Use of memory afte=
r it is freed [clang-analyzer-unix.Malloc]
           map->debugfs =3D debugfs_create_dir(name, regmap_debugfs_root);
                          ^
   drivers/base/regmap/regmap-debugfs.c:688:2: note: Loop condition is true=
.  Entering loop body
           list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, =
link) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/base/regmap/regmap-debugfs.c:689:3: note: Calling 'regmap_debugf=
s_init'
                   regmap_debugfs_init(node->map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:560:6: note: Assuming field 'debugf=
s_disable' is false
           if (map->debugfs_disable) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:560:2: note: Taking false branch
           if (map->debugfs_disable) {
           ^
   drivers/base/regmap/regmap-debugfs.c:566:6: note: Assuming 'regmap_debug=
fs_root' is non-null
           if (!regmap_debugfs_root) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:566:2: note: Taking false branch
           if (!regmap_debugfs_root) {
           ^
   drivers/base/regmap/regmap-debugfs.c:579:2: note: Loop condition is fals=
e.  Exiting loop
           mutex_init(&map->cache_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/base/regmap/regmap-debugfs.c:581:6: note: Assuming field 'dev' i=
s null
           if (map->dev)
               ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:581:2: note: Taking false branch
           if (map->dev)
           ^
   drivers/base/regmap/regmap-debugfs.c:584:6: note: Assuming 'name' is null
           if (name) {
               ^~~~
   drivers/base/regmap/regmap-debugfs.c:584:2: note: Taking false branch
           if (name) {
           ^
   drivers/base/regmap/regmap-debugfs.c:597:2: note: Taking true branch
           if (!strcmp(name, "dummy")) {
           ^
   drivers/base/regmap/regmap-debugfs.c:601:7: note: Assuming field 'debugf=
s_name' is non-null
                   if (!map->debugfs_name)

vim +597 drivers/base/regmap/regmap-debugfs.c

d3dc5430d68fb9 Richard Fitzgerald  2015-06-23  545  =

94cc89eb8fa503 Charles Keepax      2020-09-17  546  void regmap_debugfs_ini=
t(struct regmap *map)
31244e396fa9e4 Mark Brown          2011-07-20  547  {
4b020b3f9ba2af Mark Brown          2012-10-03  548  	struct rb_node *next;
4b020b3f9ba2af Mark Brown          2012-10-03  549  	struct regmap_range_no=
de *range_node;
2c98e0c1cc6b8e Xiubo Li            2014-09-28  550  	const char *devname =
=3D "dummy";
94cc89eb8fa503 Charles Keepax      2020-09-17  551  	const char *name =3D m=
ap->name;
4b020b3f9ba2af Mark Brown          2012-10-03  552  =

078711d7f88d33 Bartosz Golaszewski 2017-12-22  553  	/*
078711d7f88d33 Bartosz Golaszewski 2017-12-22  554  	 * Userspace can initi=
ate reads from the hardware over debugfs.
078711d7f88d33 Bartosz Golaszewski 2017-12-22  555  	 * Normally internal r=
egmap structures and buffers are protected with
078711d7f88d33 Bartosz Golaszewski 2017-12-22  556  	 * a mutex or a spinlo=
ck, but if the regmap owner decided to disable
078711d7f88d33 Bartosz Golaszewski 2017-12-22  557  	 * all locking mechani=
sms, this is no longer the case. For safety:
078711d7f88d33 Bartosz Golaszewski 2017-12-22  558  	 * don't create the de=
bugfs entries if locking is disabled.
078711d7f88d33 Bartosz Golaszewski 2017-12-22  559  	 */
a5ba91c380b8bc Bartosz Golaszewski 2017-12-21  560  	if (map->debugfs_disab=
le) {
a5ba91c380b8bc Bartosz Golaszewski 2017-12-21  561  		dev_dbg(map->dev, "re=
gmap locking disabled - not creating debugfs entries\n");
72465736adf2aa Mark Brown          2017-12-12  562  		return;
a5ba91c380b8bc Bartosz Golaszewski 2017-12-21  563  	}
72465736adf2aa Mark Brown          2017-12-12  564  =

a52eaeb1898bc0 Tero Kristo         2013-10-24  565  	/* If we don't have th=
e debugfs root yet, postpone init */
a52eaeb1898bc0 Tero Kristo         2013-10-24  566  	if (!regmap_debugfs_ro=
ot) {
a52eaeb1898bc0 Tero Kristo         2013-10-24  567  		struct regmap_debugfs=
_node *node;
a52eaeb1898bc0 Tero Kristo         2013-10-24  568  		node =3D kzalloc(size=
of(*node), GFP_KERNEL);
a52eaeb1898bc0 Tero Kristo         2013-10-24  569  		if (!node)
a52eaeb1898bc0 Tero Kristo         2013-10-24  570  			return;
a52eaeb1898bc0 Tero Kristo         2013-10-24  571  		node->map =3D map;
a52eaeb1898bc0 Tero Kristo         2013-10-24  572  		mutex_lock(&regmap_de=
bugfs_early_lock);
a52eaeb1898bc0 Tero Kristo         2013-10-24  573  		list_add(&node->link,=
 &regmap_debugfs_early_list);
a52eaeb1898bc0 Tero Kristo         2013-10-24  574  		mutex_unlock(&regmap_=
debugfs_early_lock);
a52eaeb1898bc0 Tero Kristo         2013-10-24  575  		return;
a52eaeb1898bc0 Tero Kristo         2013-10-24  576  	}
a52eaeb1898bc0 Tero Kristo         2013-10-24  577  =

5166b7c006eeb4 Mark Brown          2012-12-11  578  	INIT_LIST_HEAD(&map->d=
ebugfs_off_cache);
065b4c587557dc Dimitris Papastamos 2013-02-20  579  	mutex_init(&map->cache=
_lock);
5166b7c006eeb4 Mark Brown          2012-12-11  580  =

2c98e0c1cc6b8e Xiubo Li            2014-09-28  581  	if (map->dev)
2c98e0c1cc6b8e Xiubo Li            2014-09-28  582  		devname =3D dev_name(=
map->dev);
2c98e0c1cc6b8e Xiubo Li            2014-09-28  583  =

d3c242e1f22f5d Stephen Warren      2012-04-04  584  	if (name) {
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  585  		if (!map->debugfs_nam=
e) {
d3c242e1f22f5d Stephen Warren      2012-04-04  586  			map->debugfs_name =
=3D kasprintf(GFP_KERNEL, "%s-%s",
2c98e0c1cc6b8e Xiubo Li            2014-09-28  587  					      devname, nam=
e);
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  588  			if (!map->debugfs_na=
me)
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  589  				return;
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  590  		}
d3c242e1f22f5d Stephen Warren      2012-04-04  591  		name =3D map->debugfs=
_name;
7de11921ba5574 Fabio Estevam       2022-01-06  592  		kfree(map->debugfs_na=
me);
d3c242e1f22f5d Stephen Warren      2012-04-04  593  	} else {
2c98e0c1cc6b8e Xiubo Li            2014-09-28  594  		name =3D devname;
d3c242e1f22f5d Stephen Warren      2012-04-04  595  	}
d3c242e1f22f5d Stephen Warren      2012-04-04  596  =

a430ab205d29e7 Fabio Estevam       2018-03-05 @597  	if (!strcmp(name, "dum=
my")) {
2899872b627e99 Daniel Baluta       2019-05-17  598  		kfree(map->debugfs_na=
me);
46589e9c753b7c Mark Brown          2018-03-05  599  		map->debugfs_name =3D=
 kasprintf(GFP_KERNEL, "dummy%d",
46589e9c753b7c Mark Brown          2018-03-05  600  						dummy_index);
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  601  		if (!map->debugfs_nam=
e)
cffa4b2122f5f3 Xiaolei Wang        2020-12-29  602  				return;
46589e9c753b7c Mark Brown          2018-03-05  603  		name =3D map->debugfs=
_name;
7de11921ba5574 Fabio Estevam       2022-01-06  604  		kfree(map->debugfs_na=
me);
a430ab205d29e7 Fabio Estevam       2018-03-05  605  		dummy_index++;
a430ab205d29e7 Fabio Estevam       2018-03-05  606  	}
a430ab205d29e7 Fabio Estevam       2018-03-05  607  =

d3c242e1f22f5d Stephen Warren      2012-04-04  608  	map->debugfs =3D debug=
fs_create_dir(name, regmap_debugfs_root);
31244e396fa9e4 Mark Brown          2011-07-20  609  =

f0c2319f9f1967 Dimitris Papastamos 2012-02-22  610  	debugfs_create_file("n=
ame", 0400, map->debugfs,
f0c2319f9f1967 Dimitris Papastamos 2012-02-22  611  			    map, &regmap_nam=
e_fops);
f0c2319f9f1967 Dimitris Papastamos 2012-02-22  612  =

065b4c587557dc Dimitris Papastamos 2013-02-20  613  	debugfs_create_file("r=
ange", 0400, map->debugfs,
065b4c587557dc Dimitris Papastamos 2013-02-20  614  			    map, &regmap_reg=
_ranges_fops);
065b4c587557dc Dimitris Papastamos 2013-02-20  615  =

676970da5cf6fe Pawel Moll          2014-01-30  616  	if (map->max_register =
|| regmap_readable(map, 0)) {
ffff7a12ace24c Markus Pargmann     2014-09-08  617  		umode_t registers_mod=
e;
ffff7a12ace24c Markus Pargmann     2014-09-08  618  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8988010779920863789==--

