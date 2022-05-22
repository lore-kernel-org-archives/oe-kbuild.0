Content-Type: multipart/mixed; boundary="===============6036934021266615527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [wireless-next:mld 4/7] net/wireless/ap.c:73:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Mon, 23 May 2022 04:48:14 +0800
Message-ID: <202205230402.mHIwQoBy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6036934021266615527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext.git mld
head:   418110601b1711438b8c80cd605d7c65afb3bf40
commit: d45ac277fe08deaedc9966155a40eafb09e1b6fe [4/7] cfg80211: do some re=
work towards MLO link APIs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220522 (https://download.01.org/0day-ci/archi=
ve/20220523/202205230402.mHIwQoBy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next.git/commit/?id=3Dd45ac277fe08deaedc9966155a40eafb09e1b6fe
        git remote add wireless-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/wireless/wireless-next.git
        git fetch --no-tags wireless-next mld
        git checkout d45ac277fe08deaedc9966155a40eafb09e1b6fe
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                             ^
   mm/slab.h:804:9: note: expanded from macro 'for_each_kmem_cache_node'
                    if ((__n =3D get_node(__s, __node)))
                         ^~~
   mm/slub.c:4306:2: note: Taking true branch
           for_each_kmem_cache_node(s, node, n) {
           ^
   mm/slab.h:804:4: note: expanded from macro 'for_each_kmem_cache_node'
                    if ((__n =3D get_node(__s, __node)))
                    ^
   mm/slub.c:4307:3: note: Calling 'free_partial'
                   free_partial(s, n);
                   ^~~~~~~~~~~~~~~~~~
   mm/slub.c:4268:9: note: Loop condition is false.  Exiting loop
           BUG_ON(irqs_disabled());
                  ^
   include/linux/irqflags.h:261:3: note: expanded from macro 'irqs_disabled'
                   raw_local_save_flags(_flags);           \
                   ^
   include/linux/irqflags.h:187:2: note: expanded from macro 'raw_local_sav=
e_flags'
           do {                                            \
           ^
   mm/slub.c:4268:2: note: Assuming the condition is true
           BUG_ON(irqs_disabled());
           ^
   include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   mm/slub.c:4268:2: note: Taking false branch
           BUG_ON(irqs_disabled());
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/slub.c:4268:2: note: Loop condition is false.  Exiting loop
           BUG_ON(irqs_disabled());
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   mm/slub.c:4270:2: note: Loop condition is false. Execution continues on =
line 4279
           list_for_each_entry_safe(slab, h, &n->partial, slab_list) {
           ^
   include/linux/list.h:751:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   mm/slub.c:4281:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(slab, h, &discard, slab_list)
           ^
   include/linux/list.h:752:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   mm/slub.c:4771:2: warning: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memcpy(s, static_cache, kmem_cache->object_size);
           ^~~~~~
   mm/slub.c:4771:2: note: Call to function 'memcpy' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memcpy_s' in case of C11
           memcpy(s, static_cache, kmem_cache->object_size);
           ^~~~~~
   mm/slub.c:5099:3: warning: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   memcpy(l, t->loc, sizeof(struct location) * t->count);
                   ^~~~~~
   mm/slub.c:5099:3: note: Call to function 'memcpy' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memcpy_s' in case of C11
                   memcpy(l, t->loc, sizeof(struct location) * t->count);
                   ^~~~~~
   mm/slub.c:5166:3: warning: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memmove(l + 1, l,
                   ^~~~~~~
   mm/slub.c:5166:3: note: Call to function 'memmove' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memmove_s' in case of C11
                   memmove(l + 1, l,
                   ^~~~~~~
   mm/slub.c:5898:7: warning: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "%07u", s->size);
                ^~~~~~~
   mm/slub.c:5898:7: note: Call to function 'sprintf' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "%07u", s->size);
                ^~~~~~~
   Suppressed 45 warnings (43 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   net/wireless/ap.c:37:3: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&wdev->links[link_id].ap.chandef, 0,
                   ^~~~~~
   net/wireless/ap.c:37:3: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                   memset(&wdev->links[link_id].ap.chandef, 0,
                   ^~~~~~
>> net/wireless/ap.c:73:2: warning: Undefined or garbage value returned to =
caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   net/wireless/ap.c:84:8: note: Calling '__cfg80211_stop_ap'
           err =3D __cfg80211_stop_ap(rdev, dev, link_id, notify);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/ap.c:60:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   net/wireless/ap.c:62:6: note: Assuming 'link_id' is < 0
           if (link_id >=3D 0)
               ^~~~~~~~~~~~
   net/wireless/ap.c:62:2: note: Taking false branch
           if (link_id >=3D 0)
           ^
   net/wireless/ap.c:65:2: note: Assuming field 'valid_links' is 0
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5742:18: note: expanded from macro 'for_each_vali=
d_link'
                link_id < ((wdev)->valid_links ? ARRAY_SIZE((wdev)->links) =
: 1);   \
                           ^~~~~~~~~~~~~~~~~~~
   net/wireless/ap.c:65:2: note: '?' condition is false
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5742:18: note: expanded from macro 'for_each_vali=
d_link'
                link_id < ((wdev)->valid_links ? ARRAY_SIZE((wdev)->links) =
: 1);   \
                           ^
   net/wireless/ap.c:65:2: note: Loop condition is true.  Entering loop body
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5741:2: note: expanded from macro 'for_each_valid=
_link'
           for (link_id =3D 0;                                             =
          \
           ^
   net/wireless/ap.c:65:2: note: Field 'valid_links' is 0
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5744:16: note: expanded from macro 'for_each_vali=
d_link'
                   if (!(wdev)->valid_links ||                             =
        \
                                ^
   net/wireless/ap.c:65:2: note: Left side of '||' is true
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5744:28: note: expanded from macro 'for_each_vali=
d_link'
                   if (!(wdev)->valid_links ||                             =
        \
                                            ^
   net/wireless/ap.c:68:7: note: 'ret1' is 0
                   if (ret1)
                       ^~~~
   net/wireless/ap.c:68:3: note: Taking false branch
                   if (ret1)
                   ^
   net/wireless/ap.c:65:2: note: Assuming field 'valid_links' is 0
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5742:18: note: expanded from macro 'for_each_vali=
d_link'
                link_id < ((wdev)->valid_links ? ARRAY_SIZE((wdev)->links) =
: 1);   \
                           ^~~~~~~~~~~~~~~~~~~
   net/wireless/ap.c:65:2: note: '?' condition is false
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5742:18: note: expanded from macro 'for_each_vali=
d_link'
                link_id < ((wdev)->valid_links ? ARRAY_SIZE((wdev)->links) =
: 1);   \
                           ^
   net/wireless/ap.c:65:2: note: Loop condition is false. Execution continu=
es on line 73
           for_each_valid_link(dev->ieee80211_ptr, link) {
           ^
   include/net/cfg80211.h:5741:2: note: expanded from macro 'for_each_valid=
_link'
           for (link_id =3D 0;                                             =
          \
           ^
   net/wireless/ap.c:73:2: note: Undefined or garbage value returned to cal=
ler
           return ret;
           ^      ~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83627ehf.c:1608:6: note: Assuming 'type' is not equal to =
hwmon_in
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_min)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1608:23: note: Left side of '&&' is false
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_min)
                                ^
   drivers/hwmon/w83627ehf.c:1610:6: note: 'type' is not equal to hwmon_in
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_max)
               ^~~~
   drivers/hwmon/w83627ehf.c:1610:23: note: Left side of '&&' is false
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_max)
                                ^
   drivers/hwmon/w83627ehf.c:1613:6: note: Assuming 'type' is not equal to =
hwmon_fan
           if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_min)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1613:24: note: Left side of '&&' is false
           if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_min)
                                 ^
   drivers/hwmon/w83627ehf.c:1616:6: note: Assuming 'type' is equal to hwmo=
n_temp
           if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_max)
               ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1616:6: note: Left side of '&&' is true
   drivers/hwmon/w83627ehf.c:1616:28: note: Assuming 'attr' is equal to hwm=
on_temp_max

vim +73 net/wireless/ap.c

60771780c27cbc Michal Kazior             2012-06-29  12  =

60771780c27cbc Michal Kazior             2012-06-29  13  =

d45ac277fe08de Johannes Berg             2022-04-14  14  static int ___cfg8=
0211_stop_ap(struct cfg80211_registered_device *rdev,
d45ac277fe08de Johannes Berg             2022-04-14  15  			       struct n=
et_device *dev, unsigned int link_id,
d45ac277fe08de Johannes Berg             2022-04-14  16  			       bool not=
ify)
60771780c27cbc Michal Kazior             2012-06-29  17  {
60771780c27cbc Michal Kazior             2012-06-29  18  	struct wireless_d=
ev *wdev =3D dev->ieee80211_ptr;
60771780c27cbc Michal Kazior             2012-06-29  19  	int err;
60771780c27cbc Michal Kazior             2012-06-29  20  =

60771780c27cbc Michal Kazior             2012-06-29  21  	ASSERT_WDEV_LOCK(=
wdev);
60771780c27cbc Michal Kazior             2012-06-29  22  =

60771780c27cbc Michal Kazior             2012-06-29  23  	if (!rdev->ops->s=
top_ap)
60771780c27cbc Michal Kazior             2012-06-29  24  		return -EOPNOTSU=
PP;
60771780c27cbc Michal Kazior             2012-06-29  25  =

60771780c27cbc Michal Kazior             2012-06-29  26  	if (dev->ieee8021=
1_ptr->iftype !=3D NL80211_IFTYPE_AP &&
60771780c27cbc Michal Kazior             2012-06-29  27  	    dev->ieee8021=
1_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO)
60771780c27cbc Michal Kazior             2012-06-29  28  		return -EOPNOTSU=
PP;
60771780c27cbc Michal Kazior             2012-06-29  29  =

d45ac277fe08de Johannes Berg             2022-04-14  30  	if (!wdev->links[=
link_id].ap.beacon_interval)
60771780c27cbc Michal Kazior             2012-06-29  31  		return -ENOENT;
60771780c27cbc Michal Kazior             2012-06-29  32  =

d45ac277fe08de Johannes Berg             2022-04-14  33  	err =3D rdev_stop=
_ap(rdev, dev, link_id);
f4489ebeffa436 Michal Kazior             2012-06-29  34  	if (!err) {
466a306142c002 Denis Kenzior             2018-03-26  35  		wdev->conn_owner=
_nlportid =3D 0;
d45ac277fe08de Johannes Berg             2022-04-14  36  		wdev->links[link=
_id].ap.beacon_interval =3D 0;
d45ac277fe08de Johannes Berg             2022-04-14 @37  		memset(&wdev->li=
nks[link_id].ap.chandef, 0,
d45ac277fe08de Johannes Berg             2022-04-14  38  		       sizeof(wd=
ev->links[link_id].ap.chandef));
d45ac277fe08de Johannes Berg             2022-04-14  39  		wdev->u.ap.ssid_=
len =3D 0;
fa9ffc745610f3 Kyeyoon Park              2013-12-16  40  		rdev_set_qos_map=
(rdev, dev, NULL);
7c8d5e03acc680 Ilan Peer                 2014-02-25  41  		if (notify)
348baf0eac3391 Johannes Berg             2014-01-24  42  			nl80211_send_ap=
_stopped(wdev);
b35a51c7dd25a8 Vasanthakumar Thiagarajan 2017-02-27  43  =

b35a51c7dd25a8 Vasanthakumar Thiagarajan 2017-02-27  44  		/* Should we app=
ly the grace period during beaconing interface
b35a51c7dd25a8 Vasanthakumar Thiagarajan 2017-02-27  45  		 * shutdown also?
b35a51c7dd25a8 Vasanthakumar Thiagarajan 2017-02-27  46  		 */
b35a51c7dd25a8 Vasanthakumar Thiagarajan 2017-02-27  47  		cfg80211_sched_d=
fs_chan_update(rdev);
f4489ebeffa436 Michal Kazior             2012-06-29  48  	}
60771780c27cbc Michal Kazior             2012-06-29  49  =

e005bd7ddea067 Johannes Berg             2019-02-01  50  	schedule_work(&cf=
g80211_disconnect_work);
e005bd7ddea067 Johannes Berg             2019-02-01  51  =

60771780c27cbc Michal Kazior             2012-06-29  52  	return err;
60771780c27cbc Michal Kazior             2012-06-29  53  }
60771780c27cbc Michal Kazior             2012-06-29  54  =

d45ac277fe08de Johannes Berg             2022-04-14  55  int __cfg80211_sto=
p_ap(struct cfg80211_registered_device *rdev,
d45ac277fe08de Johannes Berg             2022-04-14  56  		       struct ne=
t_device *dev, int link_id,
d45ac277fe08de Johannes Berg             2022-04-14  57  		       bool noti=
fy)
d45ac277fe08de Johannes Berg             2022-04-14  58  {
d45ac277fe08de Johannes Berg             2022-04-14  59  	unsigned int link;
d45ac277fe08de Johannes Berg             2022-04-14  60  	int ret;
d45ac277fe08de Johannes Berg             2022-04-14  61  =

d45ac277fe08de Johannes Berg             2022-04-14  62  	if (link_id >=3D =
0)
d45ac277fe08de Johannes Berg             2022-04-14  63  		return ___cfg802=
11_stop_ap(rdev, dev, link_id, notify);
d45ac277fe08de Johannes Berg             2022-04-14  64  =

d45ac277fe08de Johannes Berg             2022-04-14  65  	for_each_valid_li=
nk(dev->ieee80211_ptr, link) {
d45ac277fe08de Johannes Berg             2022-04-14  66  		int ret1 =3D ___=
cfg80211_stop_ap(rdev, dev, link, notify);
d45ac277fe08de Johannes Berg             2022-04-14  67  =

d45ac277fe08de Johannes Berg             2022-04-14  68  		if (ret1)
d45ac277fe08de Johannes Berg             2022-04-14  69  			ret =3D ret1;
d45ac277fe08de Johannes Berg             2022-04-14  70  		/* try the next =
one also if one errored */
d45ac277fe08de Johannes Berg             2022-04-14  71  	}
d45ac277fe08de Johannes Berg             2022-04-14  72  =

d45ac277fe08de Johannes Berg             2022-04-14 @73  	return ret;
d45ac277fe08de Johannes Berg             2022-04-14  74  }
d45ac277fe08de Johannes Berg             2022-04-14  75  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6036934021266615527==--

