Content-Type: multipart/mixed; boundary="===============7427143536904439445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 12/15] Bluetooth: hci_event: Use of a function table to handle HCI events
Date: Sat, 04 Dec 2021 20:13:32 +0800
Message-ID: <202112042028.oaBRjSCo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7427143536904439445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201185506.1421186-13-luiz.dentz@gmail.com>
References: <20211201185506.1421186-13-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20211203]
[cannot apply to linus/master v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Luiz-Augusto-von-Dentz/Rew=
ork-parsing-of-HCI-events/20211202-025757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211204/202112042028.oaBRjSCo-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/58349a5e4f9534a585d2b787a=
5488a1b5744e694
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Rework-pars=
ing-of-HCI-events/20211202-025757
        git checkout 58349a5e4f9534a585d2b787a5488a1b5744e694
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:458:2: note: Taking false branch
           if (config =3D=3D NULL || i2c =3D=3D NULL)
           ^
   drivers/media/dvb-frontends/atbm8830.c:462:6: note: Assuming 'priv' is n=
ot equal to NULL
           if (priv =3D=3D NULL)
               ^~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:462:2: note: Taking false branch
           if (priv =3D=3D NULL)
           ^
   drivers/media/dvb-frontends/atbm8830.c:469:2: note: Taking false branch
           if (atbm8830_read_reg(priv, REG_CHIP_ID, &data) !=3D 0) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:474:2: note: Assuming 'debug' is 0
           dprintk("atbm8830 chip id: 0x%02X\n", data);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:474:2: note: Taking false branch
           dprintk("atbm8830 chip id: 0x%02X\n", data);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:474:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk("atbm8830 chip id: 0x%02X\n", data);
           ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:480:2: note: Calling 'atbm8830_in=
it'
           atbm8830_init(&priv->frontend);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:226:2: note: Calling 'set_if_freq'
           set_if_freq(priv, cfg->if_freq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:111:2: note: 'dat' declared witho=
ut an initial value
           u8 dat;
           ^~~~~~
   drivers/media/dvb-frontends/atbm8830.c:113:6: note: Assuming 'freq' is e=
qual to 0
           if (freq !=3D 0) {
               ^~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:113:2: note: Taking false branch
           if (freq !=3D 0) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:133:3: note: Calling 'atbm8830_re=
ad_reg'
                   atbm8830_read_reg(priv, REG_ADC_CONFIG, &dat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:6: note: Assuming 'ret' is not=
 equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:2: note: Taking true branch
           if (ret !=3D 1) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without wri=
ting to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:133:3: note: Returning from 'atbm=
8830_read_reg'
                   atbm8830_read_reg(priv, REG_ADC_CONFIG, &dat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:134:7: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
                   dat &=3D 0xFC;
                   ~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/bluetooth/hci_core.c:890:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:890:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/bluetooth/hci_event.c:6979:21: warning: Excessive padding in 'struct=
 hci_ev' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   , =

   min_len, =

   max_len, =

   req, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6979:21: note: Excessive padding in 'struct hc=
i_ev' (11 padding bytes, where 3 is optimal). Optimal fields order: , min_l=
en, max_len, req, consider reordering the fields or adding explicit padding=
 members
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/huge_memory.c:583:9: warning: Value stored to 'off' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:583:9: note: Value stored to 'off' during its initializ=
ation is never read
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:3096:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(file_path, tok);
                           ^~~~~~
   mm/huge_memory.c:3096:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(file_path, tok);
                           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   mm/khugepaged.c:1660:3: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                   result =3D SCAN_ALLOC_HUGE_PAGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1660:3: note: Value stored to 'result' is never read
                   result =3D SCAN_ALLOC_HUGE_PAGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1665:3: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                   result =3D SCAN_CGROUP_CHARGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1665:3: note: Value stored to 'result' is never read
                   result =3D SCAN_CGROUP_CHARGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1678:4: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                           result =3D SCAN_FAIL;
                           ^        ~~~~~~~~~
   mm/khugepaged.c:1678:4: note: Value stored to 'result' is never read
                           result =3D SCAN_FAIL;
                           ^        ~~~~~~~~~
   mm/khugepaged.c:1907:3: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   mm/khugepaged.c:1647:2: note: '?' condition is false
           XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
           ^
   include/linux/xarray.h:1367:21: note: expanded from macro 'XA_STATE_ORDE=
R'
                           order - (order % XA_CHUNK_SHIFT),       \
                                            ^
   include/linux/xarray.h:1110:26: note: expanded from macro 'XA_CHUNK_SHIF=
T'
   #define XA_CHUNK_SHIFT          (CONFIG_BASE_SMALL ? 4 : 6)
                                    ^
   ./include/generated/autoconf.h:2139:27: note: expanded from macro 'CONFI=
G_BASE_SMALL'
   #define CONFIG_BASE_SMALL 0
                             ^
   mm/khugepaged.c:1647:2: note: '?' condition is false
           XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
           ^
   include/linux/xarray.h:1368:20: note: expanded from macro 'XA_STATE_ORDE=
R'
                           (1U << (order % XA_CHUNK_SHIFT)) - 1)
                                           ^
   include/linux/xarray.h:1110:26: note: expanded from macro 'XA_CHUNK_SHIF=
T'
   #define XA_CHUNK_SHIFT          (CONFIG_BASE_SMALL ? 4 : 6)
                                    ^
   ./include/generated/autoconf.h:2139:27: note: expanded from macro 'CONFI=
G_BASE_SMALL'
   #define CONFIG_BASE_SMALL 0
                             ^
   mm/khugepaged.c:1659:6: note: Assuming 'new_page' is non-null
           if (!new_page) {
               ^~~~~~~~~
   mm/khugepaged.c:1659:2: note: Taking false branch
           if (!new_page) {

vim +6979 net/bluetooth/hci_event.c

58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6970  =

58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6971  #define HCI_EV_REQ(=
_op, _func, _len) \
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6972  	HCI_EV_REQ_VL(_op,=
 _func, _len, _len)
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6973  =

58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6974  /* Entries in this =
table shall have their position according to the event opcode
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6975   * they handle so t=
he use of the macros above is recommend since it does attempt
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6976   * to initialize at=
 its proper index using Designated Initializers that way
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6977   * events without a=
 callback function don't have entered.
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6978   */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01 @6979  static const struct=
 hci_ev {
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6980  	bool req;
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6981  	union {
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6982  		void (*func)(stru=
ct hci_dev *hdev, void *data,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6983  			     struct sk_b=
uff *skb);
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6984  		void (*func_req)(=
struct hci_dev *hdev, void *data,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6985  				 struct sk_buff=
 *skb, u16 *opcode, u8 *status,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6986  				 hci_req_comple=
te_t *req_complete,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6987  				 hci_req_comple=
te_skb_t *req_complete_skb);
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6988  	};
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6989  	u16  min_len;
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6990  	u16  max_len;
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6991  } hci_ev_table[U8_M=
AX + 1] =3D {
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6992  	/* [0x01 =3D HCI_E=
V_INQUIRY_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6993  	HCI_EV_STATUS(HCI_=
EV_INQUIRY_COMPLETE, hci_inquiry_complete_evt),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6994  	/* [0x02 =3D HCI_E=
V_INQUIRY_RESULT] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6995  	HCI_EV_VL(HCI_EV_I=
NQUIRY_RESULT, hci_inquiry_result_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6996  		  sizeof(struct h=
ci_ev_inquiry_result), HCI_MAX_EVENT_SIZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6997  	/* [0x03 =3D HCI_E=
V_CONN_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6998  	HCI_EV(HCI_EV_CONN=
_COMPLETE, hci_conn_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  6999  	       sizeof(stru=
ct hci_ev_conn_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7000  	/* [0x04 =3D HCI_E=
V_CONN_REQUEST] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7001  	HCI_EV(HCI_EV_CONN=
_REQUEST, hci_conn_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7002  	       sizeof(stru=
ct hci_ev_conn_request)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7003  	/* [0x05 =3D HCI_E=
V_DISCONN_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7004  	HCI_EV(HCI_EV_DISC=
ONN_COMPLETE, hci_disconn_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7005  	       sizeof(stru=
ct hci_ev_disconn_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7006  	/* [0x06 =3D HCI_E=
V_AUTH_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7007  	HCI_EV(HCI_EV_AUTH=
_COMPLETE, hci_auth_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7008  	       sizeof(stru=
ct hci_ev_auth_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7009  	/* [0x07 =3D HCI_E=
V_REMOTE_NAME] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7010  	HCI_EV(HCI_EV_REMO=
TE_NAME, hci_remote_name_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7011  	       sizeof(stru=
ct hci_ev_remote_name)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7012  	/* [0x08 =3D HCI_E=
V_ENCRYPT_CHANGE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7013  	HCI_EV(HCI_EV_ENCR=
YPT_CHANGE, hci_encrypt_change_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7014  	       sizeof(stru=
ct hci_ev_encrypt_change)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7015  	/* [0x09 =3D HCI_E=
V_CHANGE_LINK_KEY_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7016  	HCI_EV(HCI_EV_CHAN=
GE_LINK_KEY_COMPLETE,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7017  	       hci_change_=
link_key_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7018  	       sizeof(stru=
ct hci_ev_change_link_key_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7019  	/* [0x0b =3D HCI_E=
V_REMOTE_FEATURES] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7020  	HCI_EV(HCI_EV_REMO=
TE_FEATURES, hci_remote_features_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7021  	       sizeof(stru=
ct hci_ev_remote_features)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7022  	/* [0x0e =3D HCI_E=
V_CMD_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7023  	HCI_EV_REQ_VL(HCI_=
EV_CMD_COMPLETE, hci_cmd_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7024  		      sizeof(stru=
ct hci_ev_cmd_complete), HCI_MAX_EVENT_SIZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7025  	/* [0x0f =3D HCI_E=
V_CMD_STATUS] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7026  	HCI_EV_REQ(HCI_EV_=
CMD_STATUS, hci_cmd_status_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7027  		   sizeof(struct =
hci_ev_cmd_status)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7028  	/* [0x10 =3D HCI_E=
V_CMD_STATUS] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7029  	HCI_EV(HCI_EV_HARD=
WARE_ERROR, hci_hardware_error_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7030  	       sizeof(stru=
ct hci_ev_hardware_error)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7031  	/* [0x12 =3D HCI_E=
V_ROLE_CHANGE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7032  	HCI_EV(HCI_EV_ROLE=
_CHANGE, hci_role_change_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7033  	       sizeof(stru=
ct hci_ev_role_change)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7034  	/* [0x13 =3D HCI_E=
V_NUM_COMP_PKTS] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7035  	HCI_EV_VL(HCI_EV_N=
UM_COMP_PKTS, hci_num_comp_pkts_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7036  		  sizeof(struct h=
ci_ev_num_comp_pkts), HCI_MAX_EVENT_SIZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7037  	/* [0x14 =3D HCI_E=
V_MODE_CHANGE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7038  	HCI_EV(HCI_EV_MODE=
_CHANGE, hci_mode_change_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7039  	       sizeof(stru=
ct hci_ev_mode_change)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7040  	/* [0x16 =3D HCI_E=
V_PIN_CODE_REQ] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7041  	HCI_EV(HCI_EV_PIN_=
CODE_REQ, hci_pin_code_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7042  	       sizeof(stru=
ct hci_ev_pin_code_req)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7043  	/* [0x17 =3D HCI_E=
V_LINK_KEY_REQ] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7044  	HCI_EV(HCI_EV_LINK=
_KEY_REQ, hci_link_key_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7045  	       sizeof(stru=
ct hci_ev_link_key_req)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7046  	/* [0x18 =3D HCI_E=
V_LINK_KEY_NOTIFY] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7047  	HCI_EV(HCI_EV_LINK=
_KEY_NOTIFY, hci_link_key_notify_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7048  	       sizeof(stru=
ct hci_ev_link_key_notify)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7049  	/* [0x1c =3D HCI_E=
V_CLOCK_OFFSET] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7050  	HCI_EV(HCI_EV_CLOC=
K_OFFSET, hci_clock_offset_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7051  	       sizeof(stru=
ct hci_ev_clock_offset)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7052  	/* [0x1d =3D HCI_E=
V_PKT_TYPE_CHANGE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7053  	HCI_EV(HCI_EV_PKT_=
TYPE_CHANGE, hci_pkt_type_change_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7054  	       sizeof(stru=
ct hci_ev_pkt_type_change)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7055  	/* [0x20 =3D HCI_E=
V_PSCAN_REP_MODE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7056  	HCI_EV(HCI_EV_PSCA=
N_REP_MODE, hci_pscan_rep_mode_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7057  	       sizeof(stru=
ct hci_ev_pscan_rep_mode)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7058  	/* [0x22 =3D HCI_E=
V_INQUIRY_RESULT_WITH_RSSI] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7059  	HCI_EV_VL(HCI_EV_I=
NQUIRY_RESULT_WITH_RSSI,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7060  		  hci_inquiry_res=
ult_with_rssi_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7061  		  sizeof(struct h=
ci_ev_inquiry_result_rssi),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7062  		  HCI_MAX_EVENT_S=
IZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7063  	/* [0x23 =3D HCI_E=
V_REMOTE_EXT_FEATURES] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7064  	HCI_EV(HCI_EV_REMO=
TE_EXT_FEATURES, hci_remote_ext_features_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7065  	       sizeof(stru=
ct hci_ev_remote_ext_features)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7066  	/* [0x2c =3D HCI_E=
V_SYNC_CONN_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7067  	HCI_EV(HCI_EV_SYNC=
_CONN_COMPLETE, hci_sync_conn_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7068  	       sizeof(stru=
ct hci_ev_sync_conn_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7069  	/* [0x2d =3D HCI_E=
V_EXTENDED_INQUIRY_RESULT] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7070  	HCI_EV_VL(HCI_EV_E=
XTENDED_INQUIRY_RESULT,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7071  		  hci_extended_in=
quiry_result_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7072  		  sizeof(struct h=
ci_ev_ext_inquiry_result), HCI_MAX_EVENT_SIZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7073  	/* [0x30 =3D HCI_E=
V_KEY_REFRESH_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7074  	HCI_EV(HCI_EV_KEY_=
REFRESH_COMPLETE, hci_key_refresh_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7075  	       sizeof(stru=
ct hci_ev_key_refresh_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7076  	/* [0x31 =3D HCI_E=
V_IO_CAPA_REQUEST] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7077  	HCI_EV(HCI_EV_IO_C=
APA_REQUEST, hci_io_capa_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7078  	       sizeof(stru=
ct hci_ev_io_capa_request)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7079  	/* [0x32 =3D HCI_E=
V_IO_CAPA_REPLY] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7080  	HCI_EV(HCI_EV_IO_C=
APA_REPLY, hci_io_capa_reply_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7081  	       sizeof(stru=
ct hci_ev_io_capa_reply)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7082  	/* [0x33 =3D HCI_E=
V_USER_CONFIRM_REQUEST] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7083  	HCI_EV(HCI_EV_USER=
_CONFIRM_REQUEST, hci_user_confirm_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7084  	       sizeof(stru=
ct hci_ev_user_confirm_req)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7085  	/* [0x34 =3D HCI_E=
V_USER_PASSKEY_REQUEST] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7086  	HCI_EV(HCI_EV_USER=
_PASSKEY_REQUEST, hci_user_passkey_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7087  	       sizeof(stru=
ct hci_ev_user_passkey_req)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7088  	/* [0x35 =3D HCI_E=
V_REMOTE_OOB_DATA_REQUEST] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7089  	HCI_EV(HCI_EV_REMO=
TE_OOB_DATA_REQUEST, hci_remote_oob_data_request_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7090  	       sizeof(stru=
ct hci_ev_remote_oob_data_request)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7091  	/* [0x36 =3D HCI_E=
V_SIMPLE_PAIR_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7092  	HCI_EV(HCI_EV_SIMP=
LE_PAIR_COMPLETE, hci_simple_pair_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7093  	       sizeof(stru=
ct hci_ev_simple_pair_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7094  	/* [0x3b =3D HCI_E=
V_USER_PASSKEY_NOTIFY] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7095  	HCI_EV(HCI_EV_USER=
_PASSKEY_NOTIFY, hci_user_passkey_notify_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7096  	       sizeof(stru=
ct hci_ev_user_passkey_notify)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7097  	/* [0x3c =3D HCI_E=
V_KEYPRESS_NOTIFY] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7098  	HCI_EV(HCI_EV_KEYP=
RESS_NOTIFY, hci_keypress_notify_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7099  	       sizeof(stru=
ct hci_ev_keypress_notify)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7100  	/* [0x3d =3D HCI_E=
V_REMOTE_HOST_FEATURES] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7101  	HCI_EV(HCI_EV_REMO=
TE_HOST_FEATURES, hci_remote_host_features_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7102  	       sizeof(stru=
ct hci_ev_remote_host_features)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7103  	/* [0x3e =3D HCI_E=
V_LE_META] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7104  	HCI_EV_VL(HCI_EV_L=
E_META, hci_le_meta_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7105  		  sizeof(struct h=
ci_ev_le_meta), HCI_MAX_EVENT_SIZE),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7106  #if IS_ENABLED(CONF=
IG_BT_HS)
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7107  	/* [0x40 =3D HCI_E=
V_PHY_LINK_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7108  	HCI_EV(HCI_EV_PHY_=
LINK_COMPLETE, hci_phy_link_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7109  	       sizeof(stru=
ct hci_ev_phy_link_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7110  	/* [0x41 =3D HCI_E=
V_CHANNEL_SELECTED] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7111  	HCI_EV(HCI_EV_CHAN=
NEL_SELECTED, hci_chan_selected_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7112  	       sizeof(stru=
ct hci_ev_channel_selected)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7113  	/* [0x42 =3D HCI_E=
V_DISCONN_PHY_LINK_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7114  	HCI_EV(HCI_EV_DISC=
ONN_LOGICAL_LINK_COMPLETE,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7115  	       hci_disconn=
_loglink_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7116  	       sizeof(stru=
ct hci_ev_disconn_logical_link_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7117  	/* [0x45 =3D HCI_E=
V_LOGICAL_LINK_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7118  	HCI_EV(HCI_EV_LOGI=
CAL_LINK_COMPLETE, hci_loglink_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7119  	       sizeof(stru=
ct hci_ev_logical_link_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7120  	/* [0x46 =3D HCI_E=
V_DISCONN_LOGICAL_LINK_COMPLETE] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7121  	HCI_EV(HCI_EV_DISC=
ONN_PHY_LINK_COMPLETE,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7122  	       hci_disconn=
_phylink_complete_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7123  	       sizeof(stru=
ct hci_ev_disconn_phy_link_complete)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7124  #endif
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7125  	/* [0x48 =3D HCI_E=
V_NUM_COMP_BLOCKS] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7126  	HCI_EV(HCI_EV_NUM_=
COMP_BLOCKS, hci_num_comp_blocks_evt,
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7127  	       sizeof(stru=
ct hci_ev_num_comp_blocks)),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7128  	/* [0xff =3D HCI_E=
V_VENDOR] */
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7129  	HCI_EV(HCI_EV_VEND=
OR, msft_vendor_evt, 0),
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7130  };
58349a5e4f9534 Luiz Augusto von Dentz 2021-12-01  7131  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7427143536904439445==--

