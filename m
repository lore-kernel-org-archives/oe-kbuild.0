Content-Type: multipart/mixed; boundary="===============2767349130154794988=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning: Non-boolean value returned from function returning bool
Date: Sun, 15 Nov 2020 02:33:47 +0800
Message-ID: <202011150237.LSGf9lqL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2767349130154794988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gong <wgong@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f01c30de86f1047e9bae1b1b1417b0ce8dcd15b1
commit: 3c45f21af84eb05a355919abc80cf70a3a681cee ath10k: sdio: add firmware=
 coredump support
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: warning: Invalid value:=
 0xFF000000_S [cppcheckError]
   =

   ^
   drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: note: Invalid value: 0x=
FF000000_S
   =

   ^
   drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: note: Invalid value: 0x=
FF000000_S
   =

   ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:750:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:745:6: note: first condition
    if (ret)
        ^
   drivers/net/wireless/ath/wcn36xx/smd.c:750:9: note: second condition
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:807:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:791:6: note: first condition
    if (ret)
        ^
   drivers/net/wireless/ath/wcn36xx/smd.c:807:9: note: second condition
    return ret;
           ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:657:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg_body), WCN36XX_HAL_START_SCAN_OFFLOAD_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:688:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1276:2: warning: Redundant pointe=
r operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg_body), WCN36XX_HAL_CONFIG_BSS_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1364:2: warning: Redundant pointe=
r operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:1443:2: warning: Redundant pointe=
r operation on 'msg' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg), WCN36XX_HAL_CONFIG_BSS_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1542:3: warning: Redundant pointe=
r operation on 'msg' - it's already a pointer. [redundantPointerOp]
     PREPARE_HAL_BUF(wcn->hal_buf, (*msg));
     ^
>> drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning: Non-boolean valu=
e returned from function returning bool [returnNonBoolInBooleanFunction]
    return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
    ^

vim +2234 drivers/net/wireless/ath/ath10k/sdio.c

3c45f21af84eb05 Wen Gong 2020-08-18  2225  =

3c45f21af84eb05 Wen Gong 2020-08-18  2226  static bool ath10k_sdio_is_fast_=
dump_supported(struct ath10k *ar)
3c45f21af84eb05 Wen Gong 2020-08-18  2227  {
3c45f21af84eb05 Wen Gong 2020-08-18  2228  	u32 param;
3c45f21af84eb05 Wen Gong 2020-08-18  2229  =

3c45f21af84eb05 Wen Gong 2020-08-18  2230  	ath10k_sdio_read_host_interest_=
value(ar, HI_ITEM(hi_option_flag2), &param);
3c45f21af84eb05 Wen Gong 2020-08-18  2231  =

3c45f21af84eb05 Wen Gong 2020-08-18  2232  	ath10k_dbg(ar, ATH10K_DBG_SDIO,=
 "sdio hi_option_flag2 %x\n", param);
3c45f21af84eb05 Wen Gong 2020-08-18  2233  =

3c45f21af84eb05 Wen Gong 2020-08-18 @2234  	return param & HI_OPTION_SDIO_C=
RASH_DUMP_ENHANCEMENT_FW;
3c45f21af84eb05 Wen Gong 2020-08-18  2235  }
3c45f21af84eb05 Wen Gong 2020-08-18  2236  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2767349130154794988==--

