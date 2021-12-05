Content-Type: multipart/mixed; boundary="===============9089733813404376427=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 14/15] Bluetooth: hci_event: Use of a function table to handle Command Complete
Date: Sun, 05 Dec 2021 15:40:25 +0800
Message-ID: <202112051530.a2HY5o61-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9089733813404376427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201185506.1421186-15-luiz.dentz@gmail.com>
References: <20211201185506.1421186-15-luiz.dentz@gmail.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211205/202112051530.a2HY5o61-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6d70053be5281c234b18b9c54=
770b4302f0e90cc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Rework-pars=
ing-of-HCI-events/20211202-025757
        git checkout 6d70053be5281c234b18b9c54770b4302f0e90cc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/char/tpm/tpm_infineon.c:172:3: warning: Value stored to 'status'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_infineon.c:172:3: note: Value stored to 'status' is=
 never read
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/early/xhci-dbc.c:267:2: warning: Value stored to 'index' is =
never read [clang-analyzer-deadcode.DeadStores]
           index +=3D XDBC_STRING_ENTRY_NUM;
           ^
   drivers/usb/early/xhci-dbc.c:267:2: note: Value stored to 'index' is nev=
er read
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   10 warnings generated.
>> net/bluetooth/hci_event.c:3728:21: warning: Excessive padding in 'struct=
 hci_cc' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   func, =

   op, =

   min_len, =

   max_len, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:3728:21: note: Excessive padding in 'struct hc=
i_cc' (10 padding bytes, where 2 is optimal). Optimal fields order: func, o=
p, min_len, max_len, consider reordering the fields or adding explicit padd=
ing members
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6632:21: warning: Excessive padding in 'struct=
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
   net/bluetooth/hci_event.c:6632:21: note: Excessive padding in 'struct hc=
i_ev' (11 padding bytes, where 3 is optimal). Optimal fields order: , min_l=
en, max_len, req, consider reordering the fields or adding explicit padding=
 members
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/base/test/test_async_driver_probe.c:166:12: warning: Dereference=
 of null pointer (loaded from variable 'pdev') [clang-analyzer-core.NullDer=
eference]
           dev_info(&(*pdev)->dev,
                     ^
   include/linux/dev_printk.h:150:46: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                                       ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/base/test/test_async_driver_probe.c:104:2: note: 'pdev' initiali=
zed to a null pointer value
           struct platform_device **pdev =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/test/test_async_driver_probe.c:110:2: note: Left side of '&=
&' is true
           pr_info("registering first set of asynchronous devices...\n");
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/base/test/test_async_driver_probe.c:110:2: note: Taking true bra=
nch
           pr_info("registering first set of asynchronous devices...\n");
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/base/test/test_async_driver_probe.c:110:2: note: '?' condition i=
s true
           pr_info("registering first set of asynchronous devices...\n");
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/base/test/test_async_driver_probe.c:110:2: note: '?' condition i=
s true
           pr_info("registering first set of asynchronous devices...\n");
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \

vim +3728 net/bluetooth/hci_event.c

6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3721  =

6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3722  #define HCI_CC(_op,=
 _func, _len) \
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3723  	HCI_CC_VL(_op, _fu=
nc, _len, _len)
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3724  =

6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3725  #define HCI_CC_STAT=
US(_op, _func) \
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3726  	HCI_CC(_op, _func,=
 sizeof(struct hci_ev_status))
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3727  =

6d70053be5281c Luiz Augusto von Dentz 2021-12-01 @3728  static const struct=
 hci_cc {
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3729  	u16  op;
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3730  	u8 (*func)(struct =
hci_dev *hdev, void *data, struct sk_buff *skb);
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3731  	u16  min_len;
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3732  	u16  max_len;
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3733  } hci_cc_table[] =
=3D {
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3734  	HCI_CC_STATUS(HCI_=
OP_INQUIRY_CANCEL, hci_cc_inquiry_cancel),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3735  	HCI_CC_STATUS(HCI_=
OP_PERIODIC_INQ, hci_cc_periodic_inq),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3736  	HCI_CC_STATUS(HCI_=
OP_EXIT_PERIODIC_INQ, hci_cc_exit_periodic_inq),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3737  	HCI_CC_STATUS(HCI_=
OP_REMOTE_NAME_REQ_CANCEL,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3738  		      hci_cc_remo=
te_name_req_cancel),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3739  	HCI_CC(HCI_OP_ROLE=
_DISCOVERY, hci_cc_role_discovery,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3740  	       sizeof(stru=
ct hci_rp_role_discovery)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3741  	HCI_CC(HCI_OP_READ=
_LINK_POLICY, hci_cc_read_link_policy,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3742  	       sizeof(stru=
ct hci_rp_read_link_policy)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3743  	HCI_CC(HCI_OP_WRIT=
E_LINK_POLICY, hci_cc_write_link_policy,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3744  	       sizeof(stru=
ct hci_rp_write_link_policy)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3745  	HCI_CC(HCI_OP_READ=
_DEF_LINK_POLICY, hci_cc_read_def_link_policy,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3746  	       sizeof(stru=
ct hci_rp_read_def_link_policy)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3747  	HCI_CC_STATUS(HCI_=
OP_WRITE_DEF_LINK_POLICY,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3748  		      hci_cc_writ=
e_def_link_policy),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3749  	HCI_CC_STATUS(HCI_=
OP_RESET, hci_cc_reset),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3750  	HCI_CC(HCI_OP_READ=
_STORED_LINK_KEY, hci_cc_read_stored_link_key,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3751  	       sizeof(stru=
ct hci_rp_read_stored_link_key)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3752  	HCI_CC(HCI_OP_DELE=
TE_STORED_LINK_KEY, hci_cc_delete_stored_link_key,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3753  	       sizeof(stru=
ct hci_rp_delete_stored_link_key)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3754  	HCI_CC_STATUS(HCI_=
OP_WRITE_LOCAL_NAME, hci_cc_write_local_name),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3755  	HCI_CC(HCI_OP_READ=
_LOCAL_NAME, hci_cc_read_local_name,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3756  	       sizeof(stru=
ct hci_rp_read_local_name)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3757  	HCI_CC_STATUS(HCI_=
OP_WRITE_AUTH_ENABLE, hci_cc_write_auth_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3758  	HCI_CC_STATUS(HCI_=
OP_WRITE_ENCRYPT_MODE, hci_cc_write_encrypt_mode),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3759  	HCI_CC_STATUS(HCI_=
OP_WRITE_SCAN_ENABLE, hci_cc_write_scan_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3760  	HCI_CC_STATUS(HCI_=
OP_SET_EVENT_FLT, hci_cc_set_event_filter),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3761  	HCI_CC(HCI_OP_READ=
_CLASS_OF_DEV, hci_cc_read_class_of_dev,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3762  	       sizeof(stru=
ct hci_rp_read_class_of_dev)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3763  	HCI_CC_STATUS(HCI_=
OP_WRITE_CLASS_OF_DEV, hci_cc_write_class_of_dev),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3764  	HCI_CC(HCI_OP_READ=
_VOICE_SETTING, hci_cc_read_voice_setting,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3765  	       sizeof(stru=
ct hci_rp_read_voice_setting)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3766  	HCI_CC_STATUS(HCI_=
OP_WRITE_VOICE_SETTING, hci_cc_write_voice_setting),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3767  	HCI_CC(HCI_OP_READ=
_NUM_SUPPORTED_IAC, hci_cc_read_num_supported_iac,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3768  	       sizeof(stru=
ct hci_rp_read_num_supported_iac)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3769  	HCI_CC_STATUS(HCI_=
OP_WRITE_SSP_MODE, hci_cc_write_ssp_mode),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3770  	HCI_CC_STATUS(HCI_=
OP_WRITE_SC_SUPPORT, hci_cc_write_sc_support),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3771  	HCI_CC(HCI_OP_READ=
_AUTH_PAYLOAD_TO, hci_cc_read_auth_payload_timeout,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3772  	       sizeof(stru=
ct hci_rp_read_auth_payload_to)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3773  	HCI_CC(HCI_OP_WRIT=
E_AUTH_PAYLOAD_TO, hci_cc_write_auth_payload_timeout,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3774  	       sizeof(stru=
ct hci_rp_write_auth_payload_to)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3775  	HCI_CC(HCI_OP_READ=
_LOCAL_VERSION, hci_cc_read_local_version,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3776  	       sizeof(stru=
ct hci_rp_read_local_version)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3777  	HCI_CC(HCI_OP_READ=
_LOCAL_COMMANDS, hci_cc_read_local_commands,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3778  	       sizeof(stru=
ct hci_rp_read_local_commands)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3779  	HCI_CC(HCI_OP_READ=
_LOCAL_FEATURES, hci_cc_read_local_features,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3780  	       sizeof(stru=
ct hci_rp_read_local_features)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3781  	HCI_CC(HCI_OP_READ=
_LOCAL_EXT_FEATURES, hci_cc_read_local_ext_features,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3782  	       sizeof(stru=
ct hci_rp_read_local_ext_features)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3783  	HCI_CC(HCI_OP_READ=
_BUFFER_SIZE, hci_cc_read_buffer_size,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3784  	       sizeof(stru=
ct hci_rp_read_buffer_size)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3785  	HCI_CC(HCI_OP_READ=
_BD_ADDR, hci_cc_read_bd_addr,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3786  	       sizeof(stru=
ct hci_rp_read_bd_addr)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3787  	HCI_CC(HCI_OP_READ=
_LOCAL_PAIRING_OPTS, hci_cc_read_local_pairing_opts,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3788  	       sizeof(stru=
ct hci_rp_read_local_pairing_opts)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3789  	HCI_CC(HCI_OP_READ=
_PAGE_SCAN_ACTIVITY, hci_cc_read_page_scan_activity,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3790  	       sizeof(stru=
ct hci_rp_read_page_scan_activity)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3791  	HCI_CC_STATUS(HCI_=
OP_WRITE_PAGE_SCAN_ACTIVITY,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3792  		      hci_cc_writ=
e_page_scan_activity),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3793  	HCI_CC(HCI_OP_READ=
_PAGE_SCAN_TYPE, hci_cc_read_page_scan_type,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3794  	       sizeof(stru=
ct hci_rp_read_page_scan_type)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3795  	HCI_CC_STATUS(HCI_=
OP_WRITE_PAGE_SCAN_TYPE, hci_cc_write_page_scan_type),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3796  	HCI_CC(HCI_OP_READ=
_DATA_BLOCK_SIZE, hci_cc_read_data_block_size,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3797  	       sizeof(stru=
ct hci_rp_read_data_block_size)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3798  	HCI_CC(HCI_OP_READ=
_FLOW_CONTROL_MODE, hci_cc_read_flow_control_mode,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3799  	       sizeof(stru=
ct hci_rp_read_flow_control_mode)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3800  	HCI_CC(HCI_OP_READ=
_LOCAL_AMP_INFO, hci_cc_read_local_amp_info,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3801  	       sizeof(stru=
ct hci_rp_read_local_amp_info)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3802  	HCI_CC(HCI_OP_READ=
_CLOCK, hci_cc_read_clock,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3803  	       sizeof(stru=
ct hci_rp_read_clock)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3804  	HCI_CC(HCI_OP_READ=
_INQ_RSP_TX_POWER, hci_cc_read_inq_rsp_tx_power,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3805  	       sizeof(stru=
ct hci_rp_read_inq_rsp_tx_power)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3806  	HCI_CC(HCI_OP_READ=
_DEF_ERR_DATA_REPORTING,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3807  	       hci_cc_read=
_def_err_data_reporting,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3808  	       sizeof(stru=
ct hci_rp_read_def_err_data_reporting)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3809  	HCI_CC_STATUS(HCI_=
OP_WRITE_DEF_ERR_DATA_REPORTING,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3810  		      hci_cc_writ=
e_def_err_data_reporting),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3811  	HCI_CC(HCI_OP_PIN_=
CODE_REPLY, hci_cc_pin_code_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3812  	       sizeof(stru=
ct hci_rp_pin_code_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3813  	HCI_CC(HCI_OP_PIN_=
CODE_NEG_REPLY, hci_cc_pin_code_neg_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3814  	       sizeof(stru=
ct hci_rp_pin_code_neg_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3815  	HCI_CC(HCI_OP_READ=
_LOCAL_OOB_DATA, hci_cc_read_local_oob_data,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3816  	       sizeof(stru=
ct hci_rp_read_local_oob_data)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3817  	HCI_CC(HCI_OP_READ=
_LOCAL_OOB_EXT_DATA, hci_cc_read_local_oob_ext_data,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3818  	       sizeof(stru=
ct hci_rp_read_local_oob_ext_data)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3819  	HCI_CC(HCI_OP_LE_R=
EAD_BUFFER_SIZE, hci_cc_le_read_buffer_size,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3820  	       sizeof(stru=
ct hci_rp_le_read_buffer_size)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3821  	HCI_CC(HCI_OP_LE_R=
EAD_LOCAL_FEATURES, hci_cc_le_read_local_features,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3822  	       sizeof(stru=
ct hci_rp_le_read_local_features)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3823  	HCI_CC(HCI_OP_LE_R=
EAD_ADV_TX_POWER, hci_cc_le_read_adv_tx_power,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3824  	       sizeof(stru=
ct hci_rp_le_read_adv_tx_power)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3825  	HCI_CC(HCI_OP_USER=
_CONFIRM_REPLY, hci_cc_user_confirm_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3826  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3827  	HCI_CC(HCI_OP_USER=
_CONFIRM_NEG_REPLY, hci_cc_user_confirm_neg_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3828  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3829  	HCI_CC(HCI_OP_USER=
_PASSKEY_REPLY, hci_cc_user_passkey_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3830  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3831  	HCI_CC(HCI_OP_USER=
_PASSKEY_NEG_REPLY, hci_cc_user_passkey_neg_reply,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3832  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3833  	HCI_CC_STATUS(HCI_=
OP_LE_SET_RANDOM_ADDR, hci_cc_le_set_random_addr),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3834  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_ENABLE, hci_cc_le_set_adv_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3835  	HCI_CC_STATUS(HCI_=
OP_LE_SET_SCAN_PARAM, hci_cc_le_set_scan_param),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3836  	HCI_CC_STATUS(HCI_=
OP_LE_SET_SCAN_ENABLE, hci_cc_le_set_scan_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3837  	HCI_CC(HCI_OP_LE_R=
EAD_ACCEPT_LIST_SIZE,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3838  	       hci_cc_le_r=
ead_accept_list_size,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3839  	       sizeof(stru=
ct hci_rp_le_read_accept_list_size)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3840  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_ACCEPT_LIST, hci_cc_le_clear_accept_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3841  	HCI_CC_STATUS(HCI_=
OP_LE_ADD_TO_ACCEPT_LIST,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3842  		      hci_cc_le_a=
dd_to_accept_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3843  	HCI_CC_STATUS(HCI_=
OP_LE_DEL_FROM_ACCEPT_LIST,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3844  		      hci_cc_le_d=
el_from_accept_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3845  	HCI_CC(HCI_OP_LE_R=
EAD_SUPPORTED_STATES, hci_cc_le_read_supported_states,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3846  	       sizeof(stru=
ct hci_rp_le_read_supported_states)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3847  	HCI_CC(HCI_OP_LE_R=
EAD_DEF_DATA_LEN, hci_cc_le_read_def_data_len,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3848  	       sizeof(stru=
ct hci_rp_le_read_def_data_len)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3849  	HCI_CC_STATUS(HCI_=
OP_LE_WRITE_DEF_DATA_LEN,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3850  		      hci_cc_le_w=
rite_def_data_len),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3851  	HCI_CC_STATUS(HCI_=
OP_LE_ADD_TO_RESOLV_LIST,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3852  		      hci_cc_le_a=
dd_to_resolv_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3853  	HCI_CC_STATUS(HCI_=
OP_LE_DEL_FROM_RESOLV_LIST,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3854  		      hci_cc_le_d=
el_from_resolv_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3855  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_RESOLV_LIST,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3856  		      hci_cc_le_c=
lear_resolv_list),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3857  	HCI_CC(HCI_OP_LE_R=
EAD_RESOLV_LIST_SIZE, hci_cc_le_read_resolv_list_size,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3858  	       sizeof(stru=
ct hci_rp_le_read_resolv_list_size)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3859  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADDR_RESOLV_ENABLE,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3860  		      hci_cc_le_s=
et_addr_resolution_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3861  	HCI_CC(HCI_OP_LE_R=
EAD_MAX_DATA_LEN, hci_cc_le_read_max_data_len,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3862  	       sizeof(stru=
ct hci_rp_le_read_max_data_len)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3863  	HCI_CC_STATUS(HCI_=
OP_WRITE_LE_HOST_SUPPORTED,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3864  		      hci_cc_writ=
e_le_host_supported),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3865  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_PARAM, hci_cc_set_adv_param),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3866  	HCI_CC(HCI_OP_READ=
_RSSI, hci_cc_read_rssi,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3867  	       sizeof(stru=
ct hci_rp_read_rssi)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3868  	HCI_CC(HCI_OP_READ=
_TX_POWER, hci_cc_read_tx_power,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3869  	       sizeof(stru=
ct hci_rp_read_tx_power)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3870  	HCI_CC_STATUS(HCI_=
OP_WRITE_SSP_DEBUG_MODE, hci_cc_write_ssp_debug_mode),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3871  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_SCAN_PARAMS,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3872  		      hci_cc_le_s=
et_ext_scan_param),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3873  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_SCAN_ENABLE,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3874  		      hci_cc_le_s=
et_ext_scan_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3875  	HCI_CC_STATUS(HCI_=
OP_LE_SET_DEFAULT_PHY, hci_cc_le_set_default_phy),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3876  	HCI_CC(HCI_OP_LE_R=
EAD_NUM_SUPPORTED_ADV_SETS,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3877  	       hci_cc_le_r=
ead_num_adv_sets,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3878  	       sizeof(stru=
ct hci_rp_le_read_num_supported_adv_sets)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3879  	HCI_CC(HCI_OP_LE_S=
ET_EXT_ADV_PARAMS, hci_cc_set_ext_adv_param,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3880  	       sizeof(stru=
ct hci_rp_le_set_ext_adv_params)),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3881  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_ADV_ENABLE,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3882  		      hci_cc_le_s=
et_ext_adv_enable),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3883  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_SET_RAND_ADDR,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3884  		      hci_cc_le_s=
et_adv_set_random_addr),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3885  	HCI_CC_STATUS(HCI_=
OP_LE_REMOVE_ADV_SET, hci_cc_le_remove_adv_set),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3886  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_ADV_SETS, hci_cc_le_clear_adv_sets),
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3887  	HCI_CC(HCI_OP_LE_R=
EAD_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3888  	       sizeof(stru=
ct hci_rp_le_read_transmit_power))
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3889  };
6d70053be5281c Luiz Augusto von Dentz 2021-12-01  3890  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9089733813404376427==--

