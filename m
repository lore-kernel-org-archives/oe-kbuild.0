Content-Type: multipart/mixed; boundary="===============2304079748112477812=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jakob-koschel:lkp-patches-2022-03-29 13/95] drivers/net/wireless/ath/ath10k/mac.c:495:3: warning: Value stored to 'i' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 02 Apr 2022 08:23:56 +0800
Message-ID: <202204020827.1AJUlqIf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2304079748112477812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jakob Koschel <j.koschel@vu.nl>

tree:   https://github.com/Jakob-Koschel/linux.git lkp-patches-2022-03-29
head:   6dc5ddb23d8963e45bf24d820230bda5ab5f5714
commit: d4ae2546c1099bb7bd78cd5465eaa93f10e15290 [13/95] ath10k: use dedica=
ted list iterator variable
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20402/202204020827.1AJUlqIf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Jakob-Koschel/linux/commit/d4ae2546c1099bb7bd7=
8cd5465eaa93f10e15290
        git remote add jakob-koschel https://github.com/Jakob-Koschel/linux=
.git
        git fetch --no-tags jakob-koschel lkp-patches-2022-03-29
        git checkout d4ae2546c1099bb7bd78cd5465eaa93f10e15290
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mmc/host/usdhi6rol0.c:1691:4: note: Assuming field 'dma_active' =
is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1691:4: note: '?' condition is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   drivers/mmc/host/usdhi6rol0.c:1692:16: note: 'mrq' is null
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1692:16: note: '?' condition is false
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   drivers/mmc/host/usdhi6rol0.c:1693:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1693:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1694:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1694:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1696:12: note: Field 'dma_active' is false
           if (host->dma_active) {
                     ^
   drivers/mmc/host/usdhi6rol0.c:1696:2: note: Taking false branch
           if (host->dma_active) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1701:2: note: Control jumps to 'case USDHI=
6_WAIT_FOR_DATA_END:'  at line 1727
           switch (host->wait) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1729:15: note: Access to field 'error' res=
ults in a dereference of a null pointer (loaded from variable 'data')
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
>> drivers/net/wireless/ath/ath10k/mac.c:495:3: warning: Value stored to 'i=
' is never read [clang-analyzer-deadcode.DeadStores]
                   i =3D 0;
                   ^   ~
   drivers/net/wireless/ath/ath10k/mac.c:495:3: note: Value stored to 'i' i=
s never read
                   i =3D 0;
                   ^   ~
   drivers/net/wireless/ath/ath10k/mac.c:1613:2: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(ie, next, end - next);
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:1613:2: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
           memmove(ie, next, end - next);
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:2601:27: warning: Although the val=
ue stored to 'vht_mcs' is used in the enclosing expression, the value is ne=
ver actually read from 'vht_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath10k/mac.c:2601:27: note: Although the value =
stored to 'vht_mcs' is used in the enclosing expression, the value is never=
 actually read from 'vht_mcs'
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath10k/mac.c:2796:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(arg, 0, sizeof(*arg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:2796:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(arg, 0, sizeof(*arg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:3247:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&arg, 0, sizeof(arg));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:3247:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&arg, 0, sizeof(arg));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:3794:2: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(skb->data + IEEE80211_QOS_CTL_LEN,
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/mac.c:3794:2: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
           memmove(skb->data + IEEE80211_QOS_CTL_LEN,

vim +/i +495 drivers/net/wireless/ath/ath10k/mac.c

504f6cdf4ac3dfc Sujith Manoharan        2014-11-25  476  =

5e3dd157d7e70f0 Kalle Valo              2013-06-12  477  static int ath10k_=
clear_vdev_key(struct ath10k_vif *arvif,
5e3dd157d7e70f0 Kalle Valo              2013-06-12  478  				 struct ieee80=
211_key_conf *key)
5e3dd157d7e70f0 Kalle Valo              2013-06-12  479  {
5e3dd157d7e70f0 Kalle Valo              2013-06-12  480  	struct ath10k *ar=
 =3D arvif->ar;
d4ae2546c1099bb Jakob Koschel           2022-02-27  481  	struct ath10k_pee=
r *peer =3D NULL, *iter;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  482  	u8 addr[ETH_ALEN];
5e3dd157d7e70f0 Kalle Valo              2013-06-12  483  	int first_errno =
=3D 0;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  484  	int ret;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  485  	int i;
370e567363e693e Michal Kazior           2015-02-18  486  	u32 flags =3D 0;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  487  =

5e3dd157d7e70f0 Kalle Valo              2013-06-12  488  	lockdep_assert_he=
ld(&ar->conf_mutex);
5e3dd157d7e70f0 Kalle Valo              2013-06-12  489  =

5e3dd157d7e70f0 Kalle Valo              2013-06-12  490  	for (;;) {
5e3dd157d7e70f0 Kalle Valo              2013-06-12  491  		/* since ath10k_=
install_key we can't hold data_lock all the
d6dfe25c8bb2000 Marcin Rokicki          2017-02-20  492  		 * time, so we t=
ry to remove the keys incrementally
d6dfe25c8bb2000 Marcin Rokicki          2017-02-20  493  		 */
5e3dd157d7e70f0 Kalle Valo              2013-06-12  494  		spin_lock_bh(&ar=
->data_lock);
5e3dd157d7e70f0 Kalle Valo              2013-06-12 @495  		i =3D 0;
d4ae2546c1099bb Jakob Koschel           2022-02-27  496  		list_for_each_en=
try(iter, &ar->peers, list) {
d4ae2546c1099bb Jakob Koschel           2022-02-27  497  			for (i =3D 0; i=
 < ARRAY_SIZE(iter->keys); i++) {
d4ae2546c1099bb Jakob Koschel           2022-02-27  498  				if (iter->keys=
[i] =3D=3D key) {
d4ae2546c1099bb Jakob Koschel           2022-02-27  499  					ether_addr_co=
py(addr, iter->addr);
d4ae2546c1099bb Jakob Koschel           2022-02-27  500  					iter->keys[i]=
 =3D NULL;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  501  					break;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  502  				}
5e3dd157d7e70f0 Kalle Valo              2013-06-12  503  			}
5e3dd157d7e70f0 Kalle Valo              2013-06-12  504  =

d4ae2546c1099bb Jakob Koschel           2022-02-27  505  			if (i < ARRAY_S=
IZE(iter->keys)) {
d4ae2546c1099bb Jakob Koschel           2022-02-27  506  				peer =3D iter;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  507  				break;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  508  			}
d4ae2546c1099bb Jakob Koschel           2022-02-27  509  		}
5e3dd157d7e70f0 Kalle Valo              2013-06-12  510  		spin_unlock_bh(&=
ar->data_lock);
5e3dd157d7e70f0 Kalle Valo              2013-06-12  511  =

d4ae2546c1099bb Jakob Koschel           2022-02-27  512  		if (!peer)
5e3dd157d7e70f0 Kalle Valo              2013-06-12  513  			break;
627613f8f081928 SenthilKumar Jegadeesan 2015-01-29  514  		/* key flags are=
 not required to delete the key */
370e567363e693e Michal Kazior           2015-02-18  515  		ret =3D ath10k_i=
nstall_key(arvif, key, DISABLE_KEY, addr, flags);
ccec9038c7217e5 David Liu               2015-07-24  516  		if (ret < 0 && f=
irst_errno =3D=3D 0)
5e3dd157d7e70f0 Kalle Valo              2013-06-12  517  			first_errno =3D=
 ret;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  518  =

5e3dd157d7e70f0 Kalle Valo              2013-06-12  519  		if (ret)
7aa7a72a23679ab Michal Kazior           2014-08-25  520  			ath10k_warn(ar,=
 "failed to remove key for %pM: %d\n",
be6546fcc277464 Kalle Valo              2014-03-25  521  				    addr, ret);
5e3dd157d7e70f0 Kalle Valo              2013-06-12  522  	}
5e3dd157d7e70f0 Kalle Valo              2013-06-12  523  =

5e3dd157d7e70f0 Kalle Valo              2013-06-12  524  	return first_errn=
o;
5e3dd157d7e70f0 Kalle Valo              2013-06-12  525  }
5e3dd157d7e70f0 Kalle Valo              2013-06-12  526  =


:::::: The code@line 495 was first introduced by commit
:::::: 5e3dd157d7e70f0e3cea3f2573ed69fb156a19d5 ath10k: mac80211 driver for=
 Qualcomm Atheros 802.11ac CQA98xx devices

:::::: TO: Kalle Valo <kvalo@qca.qualcomm.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2304079748112477812==--

