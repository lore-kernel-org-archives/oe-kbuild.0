Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23C7EF
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Nov 2022 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668934494; x=1700470494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXziFTPySlBCNKogWzGwNDCsKO4pSDuVKmxoDSQoYvs=;
  b=YLwaxQ5cBoa+Vwcs+/fz37SKmMx3N1+mj93h1B3fFFmpVU8VROsnEBHa
   6JuM5qUzax0l05ygksZe2EUpZkZbE2lDwAP4QMyqKrvYfUZ2U2CJ2WEKo
   f/tCurHsgVFyJRgYym1hf5E9BK3TK545ureXsZuSOyRdHY64q9gG8RRhn
   aCBPcGSTbw1MbNubMiu83H5vs2n+PY/YLTKucYQrZkMWHXrEhi9xBPG1a
   kgQCbzM1/UDO0gk+7HVamGzKbzte3XuzhYDzwgcP4RlkXaFUmCqLeanG/
   pi4HoQKdT/YtkYLnJRdK4kR8xo+jZ8IALkqP/renxljkFyRxfKRe4IarJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10536"; a="311014525"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="311014525"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 00:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10536"; a="783120049"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="783120049"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2022 00:54:48 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owg6B-0002it-1c;
	Sun, 20 Nov 2022 08:54:47 +0000
Date: Sun, 20 Nov 2022 16:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized
 variable: response_msg [uninitvar]
Message-ID: <202211201624.I6bRbo0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized variable: response_msg [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77c51ba552a1c4f73228766e43ae37c4101b3758
commit: 716a757c83ad6208a743dd8fb1577055d0867ee8 hwrng: mpfs - add polarfire soc hwrng support
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 716a757c83ad6208a743dd8fb1577055d0867ee8
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> fs/ext4/ialloc.c:1185:27: warning: Local variable 'grp' shadows outer variable [shadowVariable]
     struct ext4_group_info *grp = NULL;
                             ^
   fs/ext4/ialloc.c:945:26: note: Shadowed declaration
    struct ext4_group_info *grp = NULL;
                            ^
   fs/ext4/ialloc.c:1185:27: note: Shadow variable
     struct ext4_group_info *grp = NULL;
                             ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized variable: response_msg [uninitvar]
     memcpy(buf + count, response_msg, copy_size_bytes);
                         ^
   drivers/char/hw_random/mpfs-rng.c:50:7: note: Assuming condition is false
     if (ret)
         ^
   drivers/char/hw_random/mpfs-rng.c:54:23: note: Uninitialized variable: response_msg
     memcpy(buf + count, response_msg, copy_size_bytes);
                         ^
--
>> drivers/firmware/turris-mox-rwtm.c:152:11: warning: Signed integer overflow for expression '3<<30'. [integerOverflow]
    else if (MBOX_STS_ERROR(retval) == MBOX_STS_FAIL)
             ^
   drivers/firmware/turris-mox-rwtm.c:154:11: warning: Signed integer overflow for expression '3<<30'. [integerOverflow]
    else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
             ^
   drivers/firmware/turris-mox-rwtm.c:154:37: warning: Signed integer overflow for expression '2<<30'. [integerOverflow]
    else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
                                       ^
   drivers/firmware/turris-mox-rwtm.c:156:11: warning: Signed integer overflow for expression '3<<30'. [integerOverflow]
    else if (MBOX_STS_ERROR(retval) != MBOX_STS_SUCCESS)
             ^
   drivers/firmware/turris-mox-rwtm.c:407:6: warning: Signed integer overflow for expression '3<<30'. [integerOverflow]
    if (MBOX_STS_ERROR(reply->retval) != MBOX_STS_SUCCESS)
        ^
--
>> drivers/media/test-drivers/vivid/vivid-radio-rx.c:163:19: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (!a->rangelow ^ !a->rangehigh)
                     ^
--
>> net/can/j1939/socket.c:144:21: warning: Uninitialized variables: session.priv, session.active_session_list_entry, session.kref, session.sk, session.skcb, session.skb_queue, session.last_cmd, session.last_txcmd, session.transmission, session.extd, session.total_message_size, session.total_queued_size, session.tx_retry, session.tskey, session.state, session.pkt, session.txtimer, session.rxtimer [uninitvar]
     j1939_session_put(session);
                       ^
>> net/can/j1939/socket.c:331:35: warning: Uninitialized variables: jsk.sk, jsk.priv, jsk.list, jsk.state, jsk.ifindex, jsk.addr, jsk.filters, jsk.nfilters, jsk.pgn_rx_filter, jsk.skb_pending, jsk.waitq, jsk.sk_session_queue_lock, jsk.sk_session_queue [uninitvar]
     match = j1939_sk_recv_match_one(jsk, skcb);
                                     ^
   net/can/j1939/socket.c:346:21: warning: Uninitialized variables: jsk.sk, jsk.priv, jsk.list, jsk.state, jsk.ifindex, jsk.addr, jsk.filters, jsk.nfilters, jsk.pgn_rx_filter, jsk.skb_pending, jsk.waitq, jsk.sk_session_queue_lock, jsk.sk_session_queue [uninitvar]
     j1939_sk_recv_one(jsk, skb);
                       ^
   net/can/j1939/socket.c:1080:31: warning: Uninitialized variables: jsk.sk, jsk.priv, jsk.list, jsk.state, jsk.ifindex, jsk.addr, jsk.filters, jsk.nfilters, jsk.pgn_rx_filter, jsk.skb_pending, jsk.waitq, jsk.sk_session_queue_lock, jsk.sk_session_queue [uninitvar]
     if (j1939_sk_recv_match_one(jsk, &session->skcb))
                                 ^
   net/can/j1939/socket.c:1071:13: note: Assuming condition is false
    if (session->sk) {
               ^
   net/can/j1939/socket.c:1080:31: note: Uninitialized variables: jsk.sk, jsk.priv, jsk.list, jsk.state, jsk.ifindex, jsk.addr, jsk.filters, jsk.nfilters, jsk.pgn_rx_filter, jsk.skb_pending, jsk.waitq, jsk.sk_session_queue_lock, jsk.sk_session_queue
     if (j1939_sk_recv_match_one(jsk, &session->skcb))
                                 ^
--
>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:483:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(str, sizeof(str), " %02d:%02d:%02d:%03d %u%s",
     ^
   drivers/media/test-drivers/vivid/vivid-kthread-cap.c:483:3: warning: %d in format string (no. 2) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(str, sizeof(str), " %02d:%02d:%02d:%03d %u%s",
     ^
   drivers/media/test-drivers/vivid/vivid-kthread-cap.c:483:3: warning: %d in format string (no. 3) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(str, sizeof(str), " %02d:%02d:%02d:%03d %u%s",
     ^
   drivers/media/test-drivers/vivid/vivid-kthread-cap.c:483:3: warning: %d in format string (no. 4) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(str, sizeof(str), " %02d:%02d:%02d:%03d %u%s",
     ^
   drivers/media/test-drivers/vivid/vivid-kthread-cap.c:495:3: warning: %d in format string (no. 3) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(str, sizeof(str), " %dx%d, input %d ",
     ^
>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:224:26: warning: Parameter 'bpl' can be declared as const array [constParameter]
       unsigned p, unsigned bpl[TPG_MAX_PLANES], unsigned h)
                            ^
>> lib/sbitmap.c:655:10: warning: Parameter 'tags' can be declared as pointer to const [constParameter]
       int *tags, int nr_tags)
            ^
--
>> drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2383:42: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     p[3] = 0x80 | (params->sav_eav_f << 6) |
                                            ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2384:16: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
      (vact << 5) | (hact << 4) |
                  ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2398:42: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     p[3] = 0x80 | (params->sav_eav_f << 6) |
                                            ^
>> drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2385:11: warning: Same expression on both sides of '^' because 'hact' and 'vact' represent the same value. [knownConditionTrueFalse]
      ((hact ^ vact) << 3) |
             ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2378:29: note: 'hact' is assigned value '0' here.
     unsigned vact = 0, hact = 0;
                               ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2378:19: note: 'vact' is assigned value '0' here.
     unsigned vact = 0, hact = 0;
                     ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2385:11: note: Same expression on both sides of '^' because 'hact' and 'vact' represent the same value.
      ((hact ^ vact) << 3) |
             ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2388:10: warning: Same expression on both sides of '^' because 'hact' and 'vact' represent the same value. [knownConditionTrueFalse]
      (hact ^ vact ^ params->sav_eav_f);
            ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2378:29: note: 'hact' is assigned value '0' here.
     unsigned vact = 0, hact = 0;
                               ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2378:19: note: 'vact' is assigned value '0' here.
     unsigned vact = 0, hact = 0;
                     ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2388:10: note: Same expression on both sides of '^' because 'hact' and 'vact' represent the same value.
      (hact ^ vact ^ params->sav_eav_f);
            ^
>> drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2377:7: warning: Local variable 'p' shadows outer argument [shadowArgument]
     u8 *p = vbuf + offset;
         ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2310:16: note: Shadowed declaration
         unsigned p, unsigned h, u8 *vbuf)
                  ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2377:7: note: Shadow variable
     u8 *p = vbuf + offset;
         ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2392:7: warning: Local variable 'p' shadows outer argument [shadowArgument]
     u8 *p = vbuf + offset;
         ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2310:16: note: Shadowed declaration
         unsigned p, unsigned h, u8 *vbuf)
                  ^
   drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2392:7: note: Shadow variable
     u8 *p = vbuf + offset;
         ^
>> net/can/j1939/transport.c:515:21: warning: Uninitialized variables: session.priv, session.active_session_list_entry, session.sk_session_queue_entry, session.kref, session.sk, session.skcb, session.skb_queue, session.last_cmd, session.last_txcmd, session.transmission, session.extd, session.total_message_size, session.total_queued_size, session.tx_retry, session.err, session.tskey, session.state, session.pkt, session.txtimer, session.rxtimer [uninitvar]
     j1939_session_get(session);
                       ^
   net/can/j1939/transport.c:536:21: warning: Uninitialized variables: session.priv, session.active_session_list_entry, session.sk_session_queue_entry, session.kref, session.sk, session.skcb, session.skb_queue, session.last_cmd, session.last_txcmd, session.transmission, session.extd, session.total_message_size, session.total_queued_size, session.tx_retry, session.err, session.tskey, session.state, session.pkt, session.txtimer, session.rxtimer [uninitvar]
     j1939_session_get(session);
                       ^
>> net/can/j1939/transport.c:2176:29: warning: Uninitialized variable: session->sk [uninitvar]
     if (!sk || sk == session->sk) {
                               ^
--
>> fs/ext4/xattr.h:156:70: warning: Parameter 'save' can be declared as pointer to const [constParameter]
   static inline void ext4_write_unlock_xattr(struct inode *inode, int *save)
                                                                        ^
   fs/ext4/ext4.h:593:2: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    CHECK_FLAG_VALUE(RESERVED);
    ^
   fs/ext4/ext4.h:593:2: warning: Signed integer overflow for expression '1<<EXT4_INODE_RESERVED'. [integerOverflow]
    CHECK_FLAG_VALUE(RESERVED);
    ^
>> fs/ext4/ext4_jbd2.h:402:9: warning: Variable '__ensure_end' is not assigned a value. [unassignedVariable]
    return ext4_journal_ensure_credits_fn(handle, credits, credits,
           ^
>> fs/ext4/ialloc.c:786:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:785:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:786:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:791:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:790:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:791:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:825:4: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:824:7: note: outer condition: err
     if (err) {
         ^
   fs/ext4/ialloc.c:825:4: note: identical inner condition: err
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1093:4: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1092:7: note: outer condition: err
     if (err) {
         ^
   fs/ext4/ialloc.c:1093:4: note: identical inner condition: err
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1128:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1127:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:1128:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1136:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1135:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:1136:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1155:4: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1153:7: note: outer condition: err
     if (err) {
         ^
   fs/ext4/ialloc.c:1155:4: note: identical inner condition: err
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1177:4: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1176:7: note: outer condition: err
     if (err) {
         ^
   fs/ext4/ialloc.c:1177:4: note: identical inner condition: err
      ext4_std_error(sb, err);
      ^
   fs/ext4/ialloc.c:1235:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1234:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:1235:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1345:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(sb, err);
     ^
   fs/ext4/ialloc.c:1344:6: note: outer condition: err
    if (err) {
        ^
   fs/ext4/ialloc.c:1345:3: note: identical inner condition: err
     ext4_std_error(sb, err);
     ^
>> drivers/scsi/qedi/qedi_main.c:873:10: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     if ((1 << log_page_size) == QEDI_PAGE_SIZE)
            ^
   drivers/scsi/qedi/qedi_main.c:872:41: note: Assuming that condition 'log_page_size<32' is not redundant
    for (log_page_size = 0 ; log_page_size < 32 ; log_page_size++) {
                                           ^
   drivers/scsi/qedi/qedi_main.c:873:10: note: Shift
     if ((1 << log_page_size) == QEDI_PAGE_SIZE)
            ^
>> drivers/scsi/qedi/qedi_main.c:873:10: warning: Signed integer overflow for expression '1<<log_page_size'. [integerOverflow]
     if ((1 << log_page_size) == QEDI_PAGE_SIZE)
            ^
   drivers/scsi/qedi/qedi_main.c:872:41: note: Assuming that condition 'log_page_size<32' is not redundant
    for (log_page_size = 0 ; log_page_size < 32 ; log_page_size++) {
                                           ^
   drivers/scsi/qedi/qedi_main.c:873:10: note: Integer overflow
     if ((1 << log_page_size) == QEDI_PAGE_SIZE)
            ^

vim +54 drivers/char/hw_random/mpfs-rng.c

716a757c83ad62 Conor Dooley 2022-04-08  26  
716a757c83ad62 Conor Dooley 2022-04-08  27  static int mpfs_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
716a757c83ad62 Conor Dooley 2022-04-08  28  {
716a757c83ad62 Conor Dooley 2022-04-08  29  	struct mpfs_rng *rng_priv = container_of(rng, struct mpfs_rng, rng);
716a757c83ad62 Conor Dooley 2022-04-08  30  	u32 response_msg[RNG_RESP_BYTES / sizeof(u32)];
716a757c83ad62 Conor Dooley 2022-04-08  31  	unsigned int count = 0, copy_size_bytes;
716a757c83ad62 Conor Dooley 2022-04-08  32  	int ret;
716a757c83ad62 Conor Dooley 2022-04-08  33  
716a757c83ad62 Conor Dooley 2022-04-08  34  	struct mpfs_mss_response response = {
716a757c83ad62 Conor Dooley 2022-04-08  35  		.resp_status = 0U,
716a757c83ad62 Conor Dooley 2022-04-08  36  		.resp_msg = (u32 *)response_msg,
716a757c83ad62 Conor Dooley 2022-04-08  37  		.resp_size = RNG_RESP_BYTES
716a757c83ad62 Conor Dooley 2022-04-08  38  	};
716a757c83ad62 Conor Dooley 2022-04-08  39  	struct mpfs_mss_msg msg = {
716a757c83ad62 Conor Dooley 2022-04-08  40  		.cmd_opcode = CMD_OPCODE,
716a757c83ad62 Conor Dooley 2022-04-08  41  		.cmd_data_size = CMD_DATA_SIZE,
716a757c83ad62 Conor Dooley 2022-04-08  42  		.response = &response,
716a757c83ad62 Conor Dooley 2022-04-08  43  		.cmd_data = CMD_DATA,
716a757c83ad62 Conor Dooley 2022-04-08  44  		.mbox_offset = MBOX_OFFSET,
716a757c83ad62 Conor Dooley 2022-04-08  45  		.resp_offset = RESP_OFFSET
716a757c83ad62 Conor Dooley 2022-04-08  46  	};
716a757c83ad62 Conor Dooley 2022-04-08  47  
716a757c83ad62 Conor Dooley 2022-04-08  48  	while (count < max) {
716a757c83ad62 Conor Dooley 2022-04-08  49  		ret = mpfs_blocking_transaction(rng_priv->sys_controller, &msg);
716a757c83ad62 Conor Dooley 2022-04-08  50  		if (ret)
716a757c83ad62 Conor Dooley 2022-04-08  51  			return ret;
716a757c83ad62 Conor Dooley 2022-04-08  52  
716a757c83ad62 Conor Dooley 2022-04-08  53  		copy_size_bytes = max - count > RNG_RESP_BYTES ? RNG_RESP_BYTES : max - count;
716a757c83ad62 Conor Dooley 2022-04-08 @54  		memcpy(buf + count, response_msg, copy_size_bytes);
716a757c83ad62 Conor Dooley 2022-04-08  55  
716a757c83ad62 Conor Dooley 2022-04-08  56  		count += copy_size_bytes;
716a757c83ad62 Conor Dooley 2022-04-08  57  		if (!wait)
716a757c83ad62 Conor Dooley 2022-04-08  58  			break;
716a757c83ad62 Conor Dooley 2022-04-08  59  	}
716a757c83ad62 Conor Dooley 2022-04-08  60  
716a757c83ad62 Conor Dooley 2022-04-08  61  	return count;
716a757c83ad62 Conor Dooley 2022-04-08  62  }
716a757c83ad62 Conor Dooley 2022-04-08  63  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
