Content-Type: multipart/mixed; boundary="===============7529236085783255917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] Bluetooth: mediatek: fix the conflict between mtk and msft vendor event
Date: Sun, 13 Feb 2022 08:25:26 +0800
Message-ID: <202202130806.UHxKw5N3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7529236085783255917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objel=
f@gmail.com>
References: <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objelf=
@gmail.com>
TO: sean.wang(a)mediatek.com
TO: marcel(a)holtmann.org
TO: johan.hedberg(a)gmail.com
CC: Mark-YW.Chen(a)mediatek.com
CC: sean.wang(a)mediatek.com
CC: Soul.Huang(a)mediatek.com
CC: YN.Chen(a)mediatek.com
CC: Leon.Yen(a)mediatek.com
CC: Eric-SY.Chang(a)mediatek.com
CC: Deren.Wu(a)mediatek.com
CC: km.lin(a)mediatek.com
CC: robin.chiu(a)mediatek.com
CC: Eddie.Chen(a)mediatek.com
CC: ch.yeh(a)mediatek.com
CC: posh.sun(a)mediatek.com
CC: ted.huang(a)mediatek.com
CC: Eric.Liang(a)mediatek.com
CC: Stella.Chang(a)mediatek.com
CC: Tom.Chou(a)mediatek.com
CC: steve.lee(a)mediatek.com
CC: jsiuda(a)google.com
CC: frankgor(a)google.com
CC: jemele(a)google.com
CC: abhishekpandit(a)google.com
CC: michaelfsun(a)google.com
CC: mcchou(a)chromium.org
CC: shawnku(a)google.com
CC: linux-bluetooth(a)vger.kernel.org
CC: linux-mediatek(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20220211]
[cannot apply to v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/Blu=
etooth-mt7921s-support-bluetooth-reset-mechanism/20220129-140313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220205 (https://download.01.org/0day-ci/arc=
hive/20220213/202202130806.UHxKw5N3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dee058=
c670593b999fec19c458dbbd882ad9de56)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/33092fd43b74594bae07555a6=
fdf15133cc8ec54
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-m=
t7921s-support-bluetooth-reset-mechanism/20220129-140313
        git checkout 33092fd43b74594bae07555a6fdf15133cc8ec54
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/mtd/nand/raw/nand_onfi.c:190:7: note: Assuming 'crc' is equal to=
 field 'crc'
                   if (crc =3D=3D le16_to_cpu(pbuf[i].crc)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:190:3: note: Taking true branch
                   if (crc =3D=3D le16_to_cpu(pbuf[i].crc)) {
                   ^
   drivers/mtd/nand/raw/nand_onfi.c:192:4: note:  Execution continues on li=
ne 196
                           break;
                           ^
   drivers/mtd/nand/raw/nand_onfi.c:196:6: note: 'i' is not equal to ONFI_P=
ARAM_PAGES
           if (i =3D=3D ONFI_PARAM_PAGES) {
               ^
   drivers/mtd/nand/raw/nand_onfi.c:196:2: note: Taking false branch
           if (i =3D=3D ONFI_PARAM_PAGES) {
           ^
   drivers/mtd/nand/raw/nand_onfi.c:215:6: note: Assuming field 'desc' is n=
ull
           if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:215:30: note: Left side of '&&' is false
           if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
                                       ^
   drivers/mtd/nand/raw/nand_onfi.c:221:6: note: Assuming the condition is =
false
           if (val & ONFI_VERSION_2_3)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:221:2: note: Taking false branch
           if (val & ONFI_VERSION_2_3)
           ^
   drivers/mtd/nand/raw/nand_onfi.c:223:11: note: Assuming the condition is=
 false
           else if (val & ONFI_VERSION_2_2)
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:223:7: note: Taking false branch
           else if (val & ONFI_VERSION_2_2)
                ^
   drivers/mtd/nand/raw/nand_onfi.c:225:11: note: Assuming the condition is=
 false
           else if (val & ONFI_VERSION_2_1)
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:225:7: note: Taking false branch
           else if (val & ONFI_VERSION_2_1)
                ^
   drivers/mtd/nand/raw/nand_onfi.c:227:11: note: Assuming the condition is=
 false
           else if (val & ONFI_VERSION_2_0)
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:227:7: note: Taking false branch
           else if (val & ONFI_VERSION_2_0)
                ^
   drivers/mtd/nand/raw/nand_onfi.c:229:11: note: Assuming the condition is=
 true
           else if (val & ONFI_VERSION_1_0)
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:229:7: note: Taking true branch
           else if (val & ONFI_VERSION_1_0)
                ^
   drivers/mtd/nand/raw/nand_onfi.c:232:7: note: 'onfi_version' is 10
           if (!onfi_version) {
                ^~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:232:2: note: Taking false branch
           if (!onfi_version) {
           ^
   drivers/mtd/nand/raw/nand_onfi.c:240:6: note: Assuming field 'model' is =
non-null
           if (!chip->parameters.model) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:240:2: note: Taking false branch
           if (!chip->parameters.model) {
           ^
   drivers/mtd/nand/raw/nand_onfi.c:265:5: note: The result of the left shi=
ft is undefined because the right operand is negative
                   1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
                     ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/bluetooth/btusb.c:2273:3: warning: Value stored to 'hdr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   hdr =3D (void *)skb->data;
                   ^     ~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c:2273:3: note: Value stored to 'hdr' is never r=
ead
                   hdr =3D (void *)skb->data;
                   ^     ~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (3 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/net/ethernet/qlogic/qed/qed_debug.c:1100:3: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                   strcpy(dump_buf, str);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:1100:3: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                   strcpy(dump_buf, str);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:1100:3: warning: Null pointe=
r passed as 1st argument to string copy function [clang-analyzer-unix.cstri=
ng.NullArg]
                   strcpy(dump_buf, str);
                   ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5676:6: note: 'status' is eq=
ual to DBG_STATUS_OK
           if (status !=3D DBG_STATUS_OK)
               ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5676:2: note: Taking false b=
ranch
           if (status !=3D DBG_STATUS_OK)
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5679:42: note: Passing null =
pointer value via 3rd parameter 'dump_buf'
           *buf_size =3D qed_ilt_dump(p_hwfn, p_ptt, NULL, 0, false);
                                                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5679:14: note: Calling 'qed_=
ilt_dump'
           *buf_size =3D qed_ilt_dump(p_hwfn, p_ptt, NULL, 0, false);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5017:6: note: 'dump' is false
           if (dump) {
               ^~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5017:2: note: Taking false b=
ranch
           if (dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5033:6: note: 'continue_dump=
' is false
           if (continue_dump) {
               ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5033:2: note: Taking false b=
ranch
           if (continue_dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5064:6: note: 'continue_dump=
' is false
           if (continue_dump) {
               ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5064:2: note: Taking false b=
ranch
           if (continue_dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5085:6: note: 'continue_dump=
' is false
           if (continue_dump) {
               ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5085:2: note: Taking false b=
ranch
           if (continue_dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5110:6: note: 'continue_dump=
' is false
           if (continue_dump) {
               ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5110:2: note: Taking false b=
ranch
           if (continue_dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5135:6: note: 'continue_dump=
' is false
           if (continue_dump) {
               ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5135:2: note: Taking false b=
ranch
           if (continue_dump) {
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5168:37: note: Passing null =
pointer value via 2nd parameter 'dump_buf'
           qed_ilt_dump_pages_section(p_hwfn, dump_buf, &offset, &continue_=
dump,
                                              ^~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5168:2: note: Calling 'qed_i=
lt_dump_pages_section'
           qed_ilt_dump_pages_section(p_hwfn, dump_buf, &offset, &continue_=
dump,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4654:17: note: 'dump_page_id=
s' is false
           section_name =3D dump_page_ids ? "ilt_page_ids" : "ilt_page_mem";
                          ^~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4654:17: note: '?' condition=
 is false
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4668:6: note: Assuming 'cont=
inue_dump' is true
           if ((continue_dump) &&
               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4668:6: note: Left side of '=
&&' is true
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4669:7: note: Assuming the c=
ondition is false
               (offset + section_header_and_param_size > buf_size_in_dwords=
)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4668:2: note: Taking false b=
ranch
           if ((continue_dump) &&
           ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4675:33: note: Passing null =
pointer value via 1st parameter 'dump_buf'
           offset +=3D qed_dump_section_hdr(dump_buf + offset,
                                          ^~~~~~~~~~~~~~~~~

vim +/hdr +2273 drivers/bluetooth/btusb.c

5a87679ffd4436 mark-yw.chen 2021-09-01  2248  =

a1c49c434e1505 Sean Wang    2019-06-02  2249  static void btusb_mtk_wmt_rec=
v(struct urb *urb)
a1c49c434e1505 Sean Wang    2019-06-02  2250  {
a1c49c434e1505 Sean Wang    2019-06-02  2251  	struct hci_dev *hdev =3D urb=
->context;
a1c49c434e1505 Sean Wang    2019-06-02  2252  	struct btusb_data *data =3D =
hci_get_drvdata(hdev);
a1c49c434e1505 Sean Wang    2019-06-02  2253  	struct hci_event_hdr *hdr;
a1c49c434e1505 Sean Wang    2019-06-02  2254  	struct sk_buff *skb;
a1c49c434e1505 Sean Wang    2019-06-02  2255  	int err;
a1c49c434e1505 Sean Wang    2019-06-02  2256  =

a1c49c434e1505 Sean Wang    2019-06-02  2257  	if (urb->status =3D=3D 0 && =
urb->actual_length > 0) {
a1c49c434e1505 Sean Wang    2019-06-02  2258  		hdev->stat.byte_rx +=3D urb=
->actual_length;
a1c49c434e1505 Sean Wang    2019-06-02  2259  =

a1c49c434e1505 Sean Wang    2019-06-02  2260  		/* WMT event shouldn't be f=
ragmented and the size should be
a1c49c434e1505 Sean Wang    2019-06-02  2261  		 * less than HCI_WMT_MAX_EV=
ENT_SIZE.
a1c49c434e1505 Sean Wang    2019-06-02  2262  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2263  		skb =3D bt_skb_alloc(HCI_WM=
T_MAX_EVENT_SIZE, GFP_ATOMIC);
a1c49c434e1505 Sean Wang    2019-06-02  2264  		if (!skb) {
a1c49c434e1505 Sean Wang    2019-06-02  2265  			hdev->stat.err_rx++;
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2266  			kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2267  			return;
a1c49c434e1505 Sean Wang    2019-06-02  2268  		}
a1c49c434e1505 Sean Wang    2019-06-02  2269  =

a1c49c434e1505 Sean Wang    2019-06-02  2270  		hci_skb_pkt_type(skb) =3D H=
CI_EVENT_PKT;
a1c49c434e1505 Sean Wang    2019-06-02  2271  		skb_put_data(skb, urb->tran=
sfer_buffer, urb->actual_length);
a1c49c434e1505 Sean Wang    2019-06-02  2272  =

a1c49c434e1505 Sean Wang    2019-06-02 @2273  		hdr =3D (void *)skb->data;
a1c49c434e1505 Sean Wang    2019-06-02  2274  =

a1c49c434e1505 Sean Wang    2019-06-02  2275  		/* When someone waits for t=
he WMT event, the skb is being cloned
a1c49c434e1505 Sean Wang    2019-06-02  2276  		 * and being processed the =
events from there then.
a1c49c434e1505 Sean Wang    2019-06-02  2277  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2278  		if (test_bit(BTUSB_TX_WAIT_=
VND_EVT, &data->flags)) {
22cc6b7a1dbb58 Johan Hovold 2019-11-28  2279  			data->evt_skb =3D skb_clon=
e(skb, GFP_ATOMIC);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2280  			if (!data->evt_skb) {
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2281  				kfree_skb(skb);
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2282  				kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2283  				return;
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2284  			}
a1c49c434e1505 Sean Wang    2019-06-02  2285  		}
a1c49c434e1505 Sean Wang    2019-06-02  2286  =

a1c49c434e1505 Sean Wang    2019-06-02  2287  		err =3D hci_recv_frame(hdev=
, skb);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2288  		if (err < 0) {
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2289  			kfree_skb(data->evt_skb);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2290  			data->evt_skb =3D NULL;
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2291  			kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2292  			return;
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2293  		}
a1c49c434e1505 Sean Wang    2019-06-02  2294  =

a1c49c434e1505 Sean Wang    2019-06-02  2295  		if (test_and_clear_bit(BTUS=
B_TX_WAIT_VND_EVT,
a1c49c434e1505 Sean Wang    2019-06-02  2296  				       &data->flags)) {
a1c49c434e1505 Sean Wang    2019-06-02  2297  			/* Barrier to sync with ot=
her CPUs */
a1c49c434e1505 Sean Wang    2019-06-02  2298  			smp_mb__after_atomic();
a1c49c434e1505 Sean Wang    2019-06-02  2299  			wake_up_bit(&data->flags,
a1c49c434e1505 Sean Wang    2019-06-02  2300  				    BTUSB_TX_WAIT_VND_EVT=
);
a1c49c434e1505 Sean Wang    2019-06-02  2301  		}
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2302  		kfree(urb->setup_packet);
a1c49c434e1505 Sean Wang    2019-06-02  2303  		return;
a1c49c434e1505 Sean Wang    2019-06-02  2304  	} else if (urb->status =3D=
=3D -ENOENT) {
a1c49c434e1505 Sean Wang    2019-06-02  2305  		/* Avoid suspend failed whe=
n usb_kill_urb */
a1c49c434e1505 Sean Wang    2019-06-02  2306  		return;
a1c49c434e1505 Sean Wang    2019-06-02  2307  	}
a1c49c434e1505 Sean Wang    2019-06-02  2308  =

a1c49c434e1505 Sean Wang    2019-06-02  2309  	usb_mark_last_busy(data->ude=
v);
a1c49c434e1505 Sean Wang    2019-06-02  2310  =

a1c49c434e1505 Sean Wang    2019-06-02  2311  	/* The URB complete handler =
is still called with urb->actual_length =3D 0
a1c49c434e1505 Sean Wang    2019-06-02  2312  	 * when the event is not ava=
ilable, so we should keep re-submitting
a1c49c434e1505 Sean Wang    2019-06-02  2313  	 * URB until WMT event retur=
ns, Also, It's necessary to wait some time
a1c49c434e1505 Sean Wang    2019-06-02  2314  	 * between the two consecuti=
ve control URBs to relax the target device
a1c49c434e1505 Sean Wang    2019-06-02  2315  	 * to generate the event. Ot=
herwise, the WMT event cannot return from
a1c49c434e1505 Sean Wang    2019-06-02  2316  	 * the device successfully.
a1c49c434e1505 Sean Wang    2019-06-02  2317  	 */
48c13301e6baba Mark Chen    2021-02-02  2318  	udelay(500);
a1c49c434e1505 Sean Wang    2019-06-02  2319  =

a1c49c434e1505 Sean Wang    2019-06-02  2320  	usb_anchor_urb(urb, &data->c=
trl_anchor);
a1c49c434e1505 Sean Wang    2019-06-02  2321  	err =3D usb_submit_urb(urb, =
GFP_ATOMIC);
a1c49c434e1505 Sean Wang    2019-06-02  2322  	if (err < 0) {
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2323  		kfree(urb->setup_packet);
a1c49c434e1505 Sean Wang    2019-06-02  2324  		/* -EPERM: urb is being kil=
led;
a1c49c434e1505 Sean Wang    2019-06-02  2325  		 * -ENODEV: device got disc=
onnected
a1c49c434e1505 Sean Wang    2019-06-02  2326  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2327  		if (err !=3D -EPERM && err =
!=3D -ENODEV)
a1c49c434e1505 Sean Wang    2019-06-02  2328  			bt_dev_err(hdev, "urb %p f=
ailed to resubmit (%d)",
a1c49c434e1505 Sean Wang    2019-06-02  2329  				   urb, -err);
a1c49c434e1505 Sean Wang    2019-06-02  2330  		usb_unanchor_urb(urb);
a1c49c434e1505 Sean Wang    2019-06-02  2331  	}
a1c49c434e1505 Sean Wang    2019-06-02  2332  }
a1c49c434e1505 Sean Wang    2019-06-02  2333  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7529236085783255917==--

