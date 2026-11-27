Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813133;
	b=f4zhQtLeNFE0wCWcZQO82aA17x8usHSP7Etr5a5DPGCJhf8gnhJTfJxvL40/gJdFAYoP
	 dTZkkZGrKw+8q50dMuC8R4bSTDmBVsGkFFCGmAkkec0MNYnUOTAzNSkqmQVxZKopaZgcR
	 y2K6RML0i4nkaQPkfUUSml+3xM4Yn3F3F8YqxpPTMB9XhzUf1CFVbObIVjOWQywrruObk
	 +rsAVA31FZywkg98VIFchJJH0BOUIiNbpR46olZboovL1gQW4kBBq1VrYZbRm4EEMmlC3
	 nPDLDe2kcV32cb7FzWprNoNXhmV6STP8UZ3NJpxeJsx9cPuOHcXwXufaRhTN+86DjXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813133;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JnyvKZIuejtsLKcOOH7kWUcOqFhcfAI4EENPaQqnF+E=;
	b=BhJXOfjc6mldzGPyshpWLOlGdSAQyU+UPiNYXP40X+qCllhKlhQFxN/2PX1Hs+PFdJwD
	 Jf2mA41tyZ+jx+0Y88Dimbg6O3xRHhwGkUvoI1uUJ+k1YnaV0mtXUeFLcF9qTKS2mR9WB
	 QxK4pz7t3DS0Tctnwdq+moBPoWy08bQpbwQ2+72h9k0VvVRtIcXFkxOCUdvjdMTbTiP75
	 sDH0lxTARkW0vdD4+HZdh3KUY9eSKUAnPnNuFcETIpeQGRpxvKTuGzrm4A1MouKbTAQgS
	 4LZ7jOxZbHD9mqVPHrSD+kknXILCTNKs5TJJWnTgV5hhIEztIishtkjPnLA4HiHlcoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4b+MkDk;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3496606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 20:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3496606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4b+MkDk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795813132; x=1827349132;
  h=date:from:to:cc:subject:message-id;
  bh=9HKxJUkuvA8KH2WeJXjsj9MxdGOQ01/G7EWbQ1lmfX4=;
  b=l4b+MkDkuxCLZsGqLjnawIr0k6KgeaXUbzK/4QiI+Cw0hUZiAhyK807Y
   JL9LdkYllUHC6kFo34/MSs9Oub2e3pnc5WXDAvfmA2h+1I/zP+4kcdEv5
   sLOU8zIOpHXpECjZWIS4QwFx+Ynpo8kwbvqQwBOXSWGDS710mjE42ZHXO
   QFyXy4hIzJusFgWkd6ALYgA70R+eTOWh/ssO2Nj4fE884MKYmAfmgO094
   dz/HsxFdnxr11pjDoDdEpvvl7J6/69Q5k0pgDOha3n1FfvrpcYKRhAOjg
   L4Hk0x31XETkRXo4e1pVnmurSvzaep2oszeIdPFs/aMvY4ke+PiRMszfM
   g==;
X-CSE-ConnectionGUID: iCyHRGgzRzqx6JoKbccMcQ==
X-CSE-MsgGUID: zKlt5J6vRsiKYiytn9kxLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4744633"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4744633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 12:58:51 -0800
X-CSE-ConnectionGUID: qHi1usaQR0Kv+ZqhxbxK1g==
X-CSE-MsgGUID: S+Rpin+/TPGzVUhyN039Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12788534"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 12:58:50 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX31r-000000000M2-31gY;
	Fri, 27 Nov 2026 20:58:47 +0000
Date: Fri, 27 Nov 2026 21:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11360/13037]
 fs/smb/server/tests/secdesc_kunit.c:742
 ksmbd_sd_decode_offset_in_header_test() error: dereferencing freed memory
 'sd' (line 738)
Message-ID: <20261127215247.un8m5F7b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Bridges <icb@fastmail.org>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5aad2bdbbee783611d32599f89cea3f12f9593d
commit: 67e9363105151861dc8ffafb407d322d19b0b374 [11360/13037] ksmbd: add a security descriptor decoder and encoder
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127215247.un8m5F7b-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261127215247.un8m5F7b-lkp@intel.com/

New smatch warnings:
fs/smb/server/tests/secdesc_kunit.c:742 ksmbd_sd_decode_offset_in_header_test() error: dereferencing freed memory 'sd' (line 738)
fs/smb/server/tests/secdesc_kunit.c:770 t_one_ace() warn: returning freed memory 'sd' (line 769)
fs/smb/server/tests/secdesc_kunit.c:874 ksmbd_sd_decode_encode_max_dacl_test() error: dereferencing freed memory 'sd' (line 869)
fs/smb/server/tests/secdesc_kunit.c:876 ksmbd_sd_decode_encode_max_dacl_test() error: dereferencing freed memory 'more' (line 875)

Old smatch warnings:
fs/smb/server/tests/secdesc_kunit.c:750 ksmbd_sd_decode_offset_in_header_test() error: dereferencing freed memory 'sd' (line 745)

vim +/sd +742 fs/smb/server/tests/secdesc_kunit.c

67e936310515186 Ian Bridges 2026-11-25  722  
67e936310515186 Ian Bridges 2026-11-25  723  /*
67e936310515186 Ian Bridges 2026-11-25  724   * An owner or a group whose offset points into the header of the SD
67e936310515186 Ian Bridges 2026-11-25  725   * (MS-DTYP 2.4.6) is left out, even when the bytes there read as a SID. With
67e936310515186 Ian Bridges 2026-11-25  726   * SACL_PRESENT clear OffsetSacl is not read, so here it is set to 1. The
67e936310515186 Ian Bridges 2026-11-25  727   * header then holds the bytes of a SID with no sub-authority at offset 12.
67e936310515186 Ian Bridges 2026-11-25  728   */
67e936310515186 Ian Bridges 2026-11-25  729  static void ksmbd_sd_decode_offset_in_header_test(struct kunit *test)
67e936310515186 Ian Bridges 2026-11-25  730  {
67e936310515186 Ian Bridges 2026-11-25  731  	const size_t len = sizeof(base_sd);
67e936310515186 Ian Bridges 2026-11-25  732  	struct ksmbd_sd *sd = NULL;
67e936310515186 Ian Bridges 2026-11-25  733  	u8 *buf = t_base_copy(test);
67e936310515186 Ian Bridges 2026-11-25  734  
67e936310515186 Ian Bridges 2026-11-25  735  	buf[O_SD_CONTROL] &= ~SACL_PRESENT;
67e936310515186 Ian Bridges 2026-11-25  736  	put_unaligned_le32(1, &buf[O_SD_SACL]);
67e936310515186 Ian Bridges 2026-11-25  737  	KUNIT_ASSERT_EQ(test, ksmbd_sd_decode(buf, len, &sd), 0);
67e936310515186 Ian Bridges 2026-11-25 @738  	kvfree(sd);
67e936310515186 Ian Bridges 2026-11-25  739  
67e936310515186 Ian Bridges 2026-11-25  740  	buf[O_SD_OWNER] = O_SD_SACL;
67e936310515186 Ian Bridges 2026-11-25  741  	KUNIT_ASSERT_EQ(test, ksmbd_sd_decode(buf, len, &sd), 0);
67e936310515186 Ian Bridges 2026-11-25 @742  	KUNIT_EXPECT_NULL(test, sd->owner);
67e936310515186 Ian Bridges 2026-11-25  743  	KUNIT_EXPECT_NOT_NULL(test, sd->group);
67e936310515186 Ian Bridges 2026-11-25  744  	KUNIT_EXPECT_TRUE(test, sd->part_dropped);
67e936310515186 Ian Bridges 2026-11-25  745  	kvfree(sd);
67e936310515186 Ian Bridges 2026-11-25  746  
67e936310515186 Ian Bridges 2026-11-25  747  	buf[O_SD_OWNER] = B_OWNER;
67e936310515186 Ian Bridges 2026-11-25  748  	buf[O_SD_GROUP] = O_SD_SACL;
67e936310515186 Ian Bridges 2026-11-25  749  	KUNIT_ASSERT_EQ(test, ksmbd_sd_decode(buf, len, &sd), 0);
67e936310515186 Ian Bridges 2026-11-25  750  	KUNIT_EXPECT_NOT_NULL(test, sd->owner);
67e936310515186 Ian Bridges 2026-11-25  751  	KUNIT_EXPECT_NULL(test, sd->group);
67e936310515186 Ian Bridges 2026-11-25  752  	KUNIT_EXPECT_TRUE(test, sd->part_dropped);
67e936310515186 Ian Bridges 2026-11-25  753  	kvfree(sd);
67e936310515186 Ian Bridges 2026-11-25  754  
67e936310515186 Ian Bridges 2026-11-25  755  	/* An SD shorter than its header is refused */
67e936310515186 Ian Bridges 2026-11-25  756  	KUNIT_EXPECT_EQ(test, ksmbd_sd_decode(buf, O_SD_HDR_LEN - 1, &sd), -EBADMSG);
67e936310515186 Ian Bridges 2026-11-25  757  }
67e936310515186 Ian Bridges 2026-11-25  758  
67e936310515186 Ian Bridges 2026-11-25  759  /* Returns an SD with one ACE, which the encoder accepts */
67e936310515186 Ian Bridges 2026-11-25  760  static struct ksmbd_sd *t_one_ace(struct kunit *test)
67e936310515186 Ian Bridges 2026-11-25  761  {
67e936310515186 Ian Bridges 2026-11-25  762  	struct ksmbd_sd *sd = t_alloc(test, 1);
67e936310515186 Ian Bridges 2026-11-25  763  
67e936310515186 Ian Bridges 2026-11-25  764  	sd->dacl = KSMBD_ACL_PRESENT;
67e936310515186 Ian Bridges 2026-11-25  765  	sd->aces[0] = (struct ksmbd_ace){
67e936310515186 Ian Bridges 2026-11-25  766  		.type = ACCESS_DENIED_ACE_TYPE, .flags = 0x13, .mask = 0x1f01ff,
67e936310515186 Ian Bridges 2026-11-25  767  		.sid = &everyone,
67e936310515186 Ian Bridges 2026-11-25  768  	};
67e936310515186 Ian Bridges 2026-11-25 @769  	KUNIT_ASSERT_EQ(test, t_try_encode(test, sd), 0);
67e936310515186 Ian Bridges 2026-11-25 @770  	return sd;
67e936310515186 Ian Bridges 2026-11-25  771  }
67e936310515186 Ian Bridges 2026-11-25  772  
67e936310515186 Ian Bridges 2026-11-25  773  /* Makes one change to an SD the encoder accepts, and expects -EINVAL */
67e936310515186 Ian Bridges 2026-11-25  774  #define T_REFUSES(what, change)						\
67e936310515186 Ian Bridges 2026-11-25  775  	do {								\
67e936310515186 Ian Bridges 2026-11-25  776  		struct ksmbd_sd *sd = t_one_ace(test);			\
67e936310515186 Ian Bridges 2026-11-25  777  		struct ksmbd_ace *ace = &sd->aces[0];			\
67e936310515186 Ian Bridges 2026-11-25  778  									\
67e936310515186 Ian Bridges 2026-11-25  779  		(void)ace;						\
67e936310515186 Ian Bridges 2026-11-25  780  		change;							\
67e936310515186 Ian Bridges 2026-11-25  781  		KUNIT_EXPECT_EQ_MSG(test, t_try_encode(test, sd), -EINVAL, what); \
67e936310515186 Ian Bridges 2026-11-25  782  	} while (0)
67e936310515186 Ian Bridges 2026-11-25  783  
67e936310515186 Ian Bridges 2026-11-25  784  /*
67e936310515186 Ian Bridges 2026-11-25  785   * The encoder returns -EINVAL for a struct ksmbd_sd that would encode to a
67e936310515186 Ian Bridges 2026-11-25  786   * malformed SD. Each T_REFUSES line makes one such change to a valid SD.
67e936310515186 Ian Bridges 2026-11-25  787   */
67e936310515186 Ian Bridges 2026-11-25  788  static void ksmbd_sd_encode_refuse_test(struct kunit *test)
67e936310515186 Ian Bridges 2026-11-25  789  {
67e936310515186 Ian Bridges 2026-11-25  790  	static const u8 flags_undefined[4] = { 4 }, flags_one_guid[4] = { 1 };
67e936310515186 Ian Bridges 2026-11-25  791  	static const u8 acl_rev3[8] = { 3, 0, 8 }, acl_and_more[12] = { 2, 0, 8 };
67e936310515186 Ian Bridges 2026-11-25  792  	static const u8 data[4];
67e936310515186 Ian Bridges 2026-11-25  793  	struct smb_sid rev2 = { .revision = 2, .num_subauth = 1 };
67e936310515186 Ian Bridges 2026-11-25  794  	struct smb_sid sub16 = { .revision = 1, .num_subauth = 16 };
67e936310515186 Ian Bridges 2026-11-25  795  
67e936310515186 Ian Bridges 2026-11-25  796  	T_REFUSES("a Control bit the encoder derives", sd->control = DACL_PRESENT);
67e936310515186 Ian Bridges 2026-11-25  797  	T_REFUSES("an owner SID of revision 2", sd->owner = &rev2);
67e936310515186 Ian Bridges 2026-11-25  798  	T_REFUSES("a group SID of 16 sub-authorities", sd->group = &sub16);
67e936310515186 Ian Bridges 2026-11-25  799  	T_REFUSES("a DACL state that is not one of the three", sd->dacl = 3);
67e936310515186 Ian Bridges 2026-11-25  800  	T_REFUSES("ACEs with a NULL DACL", sd->dacl = KSMBD_ACL_NULL);
67e936310515186 Ian Bridges 2026-11-25  801  	T_REFUSES("a DACL revision of 3", sd->dacl_revision = 3);
67e936310515186 Ian Bridges 2026-11-25  802  	T_REFUSES("a SACL state that is not one of the three", sd->sacl = 3);
67e936310515186 Ian Bridges 2026-11-25  803  	T_REFUSES("SACL bytes with no SACL",
67e936310515186 Ian Bridges 2026-11-25  804  		  sd->sacl_data = acl_and_more; sd->sacl_len = 8);
67e936310515186 Ian Bridges 2026-11-25  805  	T_REFUSES("a SACL with no bytes", sd->sacl = KSMBD_ACL_PRESENT);
67e936310515186 Ian Bridges 2026-11-25  806  	T_REFUSES("a SACL that the decoder would refuse",
67e936310515186 Ian Bridges 2026-11-25  807  		  sd->sacl = KSMBD_ACL_PRESENT; sd->sacl_data = acl_rev3;
67e936310515186 Ian Bridges 2026-11-25  808  		  sd->sacl_len = sizeof(acl_rev3));
67e936310515186 Ian Bridges 2026-11-25  809  	T_REFUSES("bytes after the SACL",
67e936310515186 Ian Bridges 2026-11-25  810  		  sd->sacl = KSMBD_ACL_PRESENT; sd->sacl_data = acl_and_more;
67e936310515186 Ian Bridges 2026-11-25  811  		  sd->sacl_len = sizeof(acl_and_more));
67e936310515186 Ian Bridges 2026-11-25  812  
67e936310515186 Ian Bridges 2026-11-25  813  	T_REFUSES("an ACE type with no layout", ace->type = 0x03);
67e936310515186 Ian Bridges 2026-11-25  814  	T_REFUSES("an ACE with no SID", ace->sid = NULL);
67e936310515186 Ian Bridges 2026-11-25  815  	T_REFUSES("an ACE SID of revision 2", ace->sid = &rev2);
67e936310515186 Ian Bridges 2026-11-25  816  	T_REFUSES("ACE data that is not a multiple of 4 bytes",
67e936310515186 Ian Bridges 2026-11-25  817  		  ace->data = data; ace->data_len = 3);
67e936310515186 Ian Bridges 2026-11-25  818  	T_REFUSES("an ACE data length with no data", ace->data_len = 4);
67e936310515186 Ian Bridges 2026-11-25  819  	T_REFUSES("an object section in an ACE that is not an object ACE",
67e936310515186 Ian Bridges 2026-11-25  820  		  ace->obj = flags_one_guid; ace->obj_len = 4);
67e936310515186 Ian Bridges 2026-11-25  821  	T_REFUSES("an object ACE with no object section",
67e936310515186 Ian Bridges 2026-11-25  822  		  ace->type = ACCESS_ALLOWED_OBJECT_ACE_TYPE; ace->obj_len = 20);
67e936310515186 Ian Bridges 2026-11-25  823  	T_REFUSES("an object ACE with an undefined flag",
67e936310515186 Ian Bridges 2026-11-25  824  		  ace->type = ACCESS_ALLOWED_OBJECT_ACE_TYPE;
67e936310515186 Ian Bridges 2026-11-25  825  		  ace->obj = flags_undefined; ace->obj_len = 4);
67e936310515186 Ian Bridges 2026-11-25  826  	T_REFUSES("an object section shorter than its Flags say",
67e936310515186 Ian Bridges 2026-11-25  827  		  ace->type = ACCESS_ALLOWED_OBJECT_ACE_TYPE;
67e936310515186 Ian Bridges 2026-11-25  828  		  ace->obj = flags_one_guid; ace->obj_len = 4);
67e936310515186 Ian Bridges 2026-11-25  829  }
67e936310515186 Ian Bridges 2026-11-25  830  
67e936310515186 Ian Bridges 2026-11-25  831  #define T_MAX_ACES	((U16_MAX - 8) / 16)
67e936310515186 Ian Bridges 2026-11-25  832  
67e936310515186 Ian Bridges 2026-11-25  833  /*
67e936310515186 Ian Bridges 2026-11-25  834   * AclSize is 16 bits wide (MS-DTYP 2.4.5), so a DACL holds at most U16_MAX
67e936310515186 Ian Bridges 2026-11-25  835   * bytes, and at most 4095 ACEs since the smallest ACE is 16 bytes. The decoder
67e936310515186 Ian Bridges 2026-11-25  836   * accepts a DACL of 4095 ACEs and the encoder writes it again. The encoder
67e936310515186 Ian Bridges 2026-11-25  837   * refuses a DACL with one ACE more, which would be too large.
67e936310515186 Ian Bridges 2026-11-25  838   */
67e936310515186 Ian Bridges 2026-11-25  839  static void ksmbd_sd_decode_encode_max_dacl_test(struct kunit *test)
67e936310515186 Ian Bridges 2026-11-25  840  {
67e936310515186 Ian Bridges 2026-11-25  841  	const size_t n = T_MAX_ACES, len = O_SD_HDR_LEN + U16_MAX;
67e936310515186 Ian Bridges 2026-11-25  842  	struct ksmbd_sd *sd = NULL, *more;
67e936310515186 Ian Bridges 2026-11-25  843  	size_t i;
67e936310515186 Ian Bridges 2026-11-25  844  	u8 *buf;
67e936310515186 Ian Bridges 2026-11-25  845  
67e936310515186 Ian Bridges 2026-11-25  846  	/*
67e936310515186 Ian Bridges 2026-11-25  847  	 * A DACL of 4095 ACEs whose SIDs have no sub-authority, followed by
67e936310515186 Ian Bridges 2026-11-25  848  	 * 7 unused bytes
67e936310515186 Ian Bridges 2026-11-25  849  	 */
67e936310515186 Ian Bridges 2026-11-25  850  	buf = kunit_kzalloc(test, len, GFP_KERNEL);
67e936310515186 Ian Bridges 2026-11-25  851  	KUNIT_ASSERT_NOT_NULL(test, buf);
67e936310515186 Ian Bridges 2026-11-25  852  	buf[O_SD_REVISION] = 1;
67e936310515186 Ian Bridges 2026-11-25  853  	put_unaligned_le16(SELF_RELATIVE | DACL_PRESENT, &buf[O_SD_CONTROL]);
67e936310515186 Ian Bridges 2026-11-25  854  	put_unaligned_le32(O_SD_HDR_LEN, &buf[O_SD_DACL]);
67e936310515186 Ian Bridges 2026-11-25  855  	buf[O_SD_HDR_LEN + O_ACL_REVISION] = 2;
67e936310515186 Ian Bridges 2026-11-25  856  	put_unaligned_le16(U16_MAX, &buf[O_SD_HDR_LEN + O_ACL_SIZE]);
67e936310515186 Ian Bridges 2026-11-25  857  	put_unaligned_le16(n, &buf[O_SD_HDR_LEN + O_ACL_COUNT]);
67e936310515186 Ian Bridges 2026-11-25  858  	for (i = 0; i < n; i++) {
67e936310515186 Ian Bridges 2026-11-25  859  		u8 *ace = &buf[O_SD_HDR_LEN + O_ACL_HDR_LEN + 16 * i];
67e936310515186 Ian Bridges 2026-11-25  860  
67e936310515186 Ian Bridges 2026-11-25  861  		put_unaligned_le16(16, &ace[O_ACE_SIZE]);
67e936310515186 Ian Bridges 2026-11-25  862  		put_unaligned_le32(i + 1, &ace[O_ACE_MASK]);
67e936310515186 Ian Bridges 2026-11-25  863  		ace[8 + O_SID_REVISION] = 1;
67e936310515186 Ian Bridges 2026-11-25  864  		ace[8 + O_SID_AUTHORITY] = 5;
67e936310515186 Ian Bridges 2026-11-25  865  	}
67e936310515186 Ian Bridges 2026-11-25  866  	sd = t_decode(test, buf, len);
67e936310515186 Ian Bridges 2026-11-25  867  	KUNIT_ASSERT_EQ(test, sd->num_aces, n);
67e936310515186 Ian Bridges 2026-11-25  868  	KUNIT_EXPECT_EQ(test, sd->aces[n - 1].mask, n);
67e936310515186 Ian Bridges 2026-11-25 @869  	KUNIT_EXPECT_EQ(test, t_try_encode(test, sd), 0);
67e936310515186 Ian Bridges 2026-11-25  870  	/* One ACE more makes the DACL too large for the encoder */
67e936310515186 Ian Bridges 2026-11-25  871  	more = t_alloc(test, n + 1);
67e936310515186 Ian Bridges 2026-11-25  872  	more->dacl = KSMBD_ACL_PRESENT;
67e936310515186 Ian Bridges 2026-11-25  873  	memcpy(more->aces, sd->aces, flex_array_size(sd, aces, n));
67e936310515186 Ian Bridges 2026-11-25 @874  	more->aces[n] = sd->aces[0];
67e936310515186 Ian Bridges 2026-11-25 @875  	KUNIT_EXPECT_EQ(test, t_try_encode(test, more), -E2BIG);
67e936310515186 Ian Bridges 2026-11-25 @876  	more->num_aces = n;
67e936310515186 Ian Bridges 2026-11-25  877  	KUNIT_EXPECT_EQ(test, t_try_encode(test, more), 0);
67e936310515186 Ian Bridges 2026-11-25  878  }
67e936310515186 Ian Bridges 2026-11-25  879  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
