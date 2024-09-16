Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DE15B543
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726513048; cv=none; b=Mu3renqfwK7Ylkqj/o3s3pRNy8kMfIwr7Kt1Su97FTKhRX8ew1GlpOXddbvR3GZlK3lz3I1S+8WMgS/TzkrL/I+K8vBIvdWhZ1Yan/1hFrAF+bQY62KApV3f140Uq7bgbxjy8vPVZYH3K0lTyW9TNq0RmJdIfkDvdGD4zOJxs7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726513048; c=relaxed/simple;
	bh=3JFUcsnGvh350nbLNZkKkgnUf25fZWqPJtMBHGCxVuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVNxS7O+bBSd7b9umN+R4qH/Zsgc4dhWNOVHW7CjpWRWat0sKMt+7T8U+tyFTmx6IRcV3bygG/skm79MmqkFMEr6uYXhUfZq+Y6PbqqoWNe2/cPkEaAn5Y9axj0xAXfGjvRhXwpNKVvFTsAG1F9q7UGiprf0ROWKY2nDaRxxfsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVbBnA/N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVbBnA/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726513046; x=1758049046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JFUcsnGvh350nbLNZkKkgnUf25fZWqPJtMBHGCxVuc=;
  b=bVbBnA/N/+V14Eq9nsxdywIvqgLDbzd3LetgkYjvBNiJFSf5BXeFH29G
   rI27lOQCXWeaGsTmMid8JOLCx183CfK04OOYEHm3+n0VXSN/FHbl9c+R4
   fal7UfRubsaaG4rtJ2v4EaIw+iXrJM6HTmTw7SOqw/Xj3jI3B01McKuLf
   FUpp+Vn9eagLjdcMtR7vrvFAqAy7ObT7F7JWV3NtHlPttwlq7YR8r7HUT
   4tk8p3tlwmvpY5vCRWkqRHI8Dn5qY6Pvl0rTfH/n4w3QUUbdzLzZSj/mX
   NuZj9/zUY0yB6UJyIEU/rRpZ1O4EGKKI+Yu4DGR6JvOXoOnrKrTsxmd1l
   Q==;
X-CSE-ConnectionGUID: R+hV1fD4R76IDcJ7a9oToQ==
X-CSE-MsgGUID: jBSc7LCrQbybbyEg8asVRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29249738"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29249738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 11:57:25 -0700
X-CSE-ConnectionGUID: s39RvXv6TAmc1FkyaQOTqg==
X-CSE-MsgGUID: A2yGhDJTTx+G170F3oB1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="99632800"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2024 11:57:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqGuX-000APp-27;
	Mon, 16 Sep 2024 18:57:21 +0000
Date: Tue, 17 Sep 2024 02:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10057/12187]
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef() error: buffer
 overflow 'iir_coef_tbl_list' 8 <= 8
Message-ID: <202409170207.1RX3sx54-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mark Brown <broonie@kernel.org>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7083504315d64199a329de322fce989e1e10f4f7
commit: 16faf8cb4c1a82ffd799268197a42a214b1dcbbf [10057/12187] ASoC: mt8365: Fix -Werror builds
:::::: branch date: 9 hours ago
:::::: commit date: 7 days ago
config: mips-randconfig-r072-20240916 (https://download.01.org/0day-ci/archive/20240917/202409170207.1RX3sx54-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409170207.1RX3sx54-lkp@intel.com/

New smatch warnings:
sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef() error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

Old smatch warnings:
sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:272 get_iir_coef() error: buffer overflow 'iir_coef_tbl_list' 8 <= 8
sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:478 mt8365_afe_set_i2s_out_enable() error: uninitialized symbol 'i2s_data'.
sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:483 mt8365_afe_set_i2s_out_enable() error: uninitialized symbol 'i2s_data'.

vim +/iir_coef_tbl_list +271 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c

402bbb13a195ca Alexandre Mergnat 2024-07-22   79  
402bbb13a195ca Alexandre Mergnat 2024-07-22   80  static const u32 *get_iir_coef(unsigned int input_fs,
402bbb13a195ca Alexandre Mergnat 2024-07-22   81  			       unsigned int output_fs, unsigned int *count)
402bbb13a195ca Alexandre Mergnat 2024-07-22   82  {
402bbb13a195ca Alexandre Mergnat 2024-07-22   83  	static const u32 IIR_COEF_48_TO_44p1[30] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22   84  		0x061fb0, 0x0bd256, 0x061fb0, 0xe3a3e6, 0xf0a300, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22   85  		0x0e416d, 0x1bb577, 0x0e416d, 0xe59178, 0xf23637, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22   86  		0x0c7d72, 0x189060, 0x0c7d72, 0xe96f09, 0xf505b2, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22   87  		0x126054, 0x249143, 0x126054, 0xe1fc0c, 0xf4b20a, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   88  		0x000000, 0x323c85, 0x323c85, 0xf76d4e, 0x000000, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   89  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22   90  
402bbb13a195ca Alexandre Mergnat 2024-07-22   91  	static const u32 IIR_COEF_44p1_TO_32[42] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22   92  		0x0a6074, 0x0d237a, 0x0a6074, 0xdd8d6c, 0xe0b3f6, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   93  		0x0e41f8, 0x128d48, 0x0e41f8, 0xefc14e, 0xf12d7a, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22   94  		0x0cfa60, 0x11e89c, 0x0cfa60, 0xf1b09e, 0xf27205, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22   95  		0x15b69c, 0x20e7e4, 0x15b69c, 0xea799a, 0xe9314a, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   96  		0x0f79e2, 0x1a7064, 0x0f79e2, 0xf65e4a, 0xf03d8e, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   97  		0x10c34f, 0x1ffe4b, 0x10c34f, 0x0bbecb, 0xf2bc4b, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22   98  		0x000000, 0x23b063, 0x23b063, 0x07335f, 0x000000, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22   99  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  100  
402bbb13a195ca Alexandre Mergnat 2024-07-22  101  	static const u32 IIR_COEF_48_TO_32[42] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  102  		0x0a2a9b, 0x0a2f05, 0x0a2a9b, 0xe73873, 0xe0c525, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  103  		0x0dd4ad, 0x0e765a, 0x0dd4ad, 0xf49808, 0xf14844, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  104  		0x18a8cd, 0x1c40d0, 0x18a8cd, 0xed2aab, 0xe542ec, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  105  		0x13e044, 0x1a47c4, 0x13e044, 0xf44aed, 0xe9acc7, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  106  		0x1abd9c, 0x2a5429, 0x1abd9c, 0xff3441, 0xe0fc5f, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  107  		0x0d86db, 0x193e2e, 0x0d86db, 0x1a6f15, 0xf14507, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  108  		0x000000, 0x1f820c, 0x1f820c, 0x0a1b1f, 0x000000, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  109  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  110  
402bbb13a195ca Alexandre Mergnat 2024-07-22  111  	static const u32 IIR_COEF_32_TO_16[48] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  112  		0x122893, 0xffadd4, 0x122893, 0x0bc205, 0xc0ee1c, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  113  		0x1bab8a, 0x00750d, 0x1bab8a, 0x06a983, 0xe18a5c, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  114  		0x18f68e, 0x02706f, 0x18f68e, 0x0886a9, 0xe31bcb, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  115  		0x149c05, 0x054487, 0x149c05, 0x0bec31, 0xe5973e, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  116  		0x0ea303, 0x07f24a, 0x0ea303, 0x115ff9, 0xe967b6, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  117  		0x0823fd, 0x085531, 0x0823fd, 0x18d5b4, 0xee8d21, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  118  		0x06888e, 0x0acbbb, 0x06888e, 0x40b55c, 0xe76dce, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  119  		0x000000, 0x2d31a9, 0x2d31a9, 0x23ba4f, 0x000000, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  120  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  121  
402bbb13a195ca Alexandre Mergnat 2024-07-22  122  	static const u32 IIR_COEF_96_TO_44p1[48] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  123  		0x08b543, 0xfd80f4, 0x08b543, 0x0e2332, 0xe06ed0, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  124  		0x1b6038, 0xf90e7e, 0x1b6038, 0x0ec1ac, 0xe16f66, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  125  		0x188478, 0xfbb921, 0x188478, 0x105859, 0xe2e596, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  126  		0x13eff3, 0xffa707, 0x13eff3, 0x13455c, 0xe533b7, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  127  		0x0dc239, 0x03d458, 0x0dc239, 0x17f120, 0xe8b617, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  128  		0x0745f1, 0x05d790, 0x0745f1, 0x1e3d75, 0xed5f18, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  129  		0x05641f, 0x085e2b, 0x05641f, 0x48efd0, 0xe3e9c8, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  130  		0x000000, 0x28f632, 0x28f632, 0x273905, 0x000000, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  131  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  132  
402bbb13a195ca Alexandre Mergnat 2024-07-22  133  	static const u32 IIR_COEF_44p1_TO_16[48] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  134  		0x0998fb, 0xf7f925, 0x0998fb, 0x1e54a0, 0xe06605, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  135  		0x0d828e, 0xf50f97, 0x0d828e, 0x0f41b5, 0xf0a999, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  136  		0x17ebeb, 0xee30d8, 0x17ebeb, 0x1f48ca, 0xe2ae88, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  137  		0x12fab5, 0xf46ddc, 0x12fab5, 0x20cc51, 0xe4d068, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  138  		0x0c7ac6, 0xfbd00e, 0x0c7ac6, 0x2337da, 0xe8028c, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  139  		0x060ddc, 0x015b3e, 0x060ddc, 0x266754, 0xec21b6, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  140  		0x0407b5, 0x04f827, 0x0407b5, 0x52e3d0, 0xe0149f, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  141  		0x000000, 0x1f9521, 0x1f9521, 0x2ac116, 0x000000, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  142  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  143  
402bbb13a195ca Alexandre Mergnat 2024-07-22  144  	static const u32 IIR_COEF_48_TO_16[48] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  145  		0x0955ff, 0xf6544a, 0x0955ff, 0x2474e5, 0xe062e6, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  146  		0x0d4180, 0xf297f4, 0x0d4180, 0x12415b, 0xf0a3b0, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  147  		0x0ba079, 0xf4f0b0, 0x0ba079, 0x1285d3, 0xf1488b, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  148  		0x12247c, 0xf1033c, 0x12247c, 0x2625be, 0xe48e0d, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  149  		0x0b98e0, 0xf96d1a, 0x0b98e0, 0x27e79c, 0xe7798a, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  150  		0x055e3b, 0xffed09, 0x055e3b, 0x2a2e2d, 0xeb2854, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  151  		0x01a934, 0x01ca03, 0x01a934, 0x2c4fea, 0xee93ab, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  152  		0x000000, 0x1c46c5, 0x1c46c5, 0x2d37dc, 0x000000, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  153  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  154  
402bbb13a195ca Alexandre Mergnat 2024-07-22  155  	static const u32 IIR_COEF_96_TO_16[48] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  156  		0x0805a1, 0xf21ae3, 0x0805a1, 0x3840bb, 0xe02a2e, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  157  		0x0d5dd8, 0xe8f259, 0x0d5dd8, 0x1c0af6, 0xf04700, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  158  		0x0bb422, 0xec08d9, 0x0bb422, 0x1bfccc, 0xf09216, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  159  		0x08fde6, 0xf108be, 0x08fde6, 0x1bf096, 0xf10ae0, 0x000003,
402bbb13a195ca Alexandre Mergnat 2024-07-22  160  		0x0ae311, 0xeeeda3, 0x0ae311, 0x37c646, 0xe385f5, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  161  		0x044089, 0xfa7242, 0x044089, 0x37a785, 0xe56526, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  162  		0x00c75c, 0xffb947, 0x00c75c, 0x378ba3, 0xe72c5f, 0x000002,
402bbb13a195ca Alexandre Mergnat 2024-07-22  163  		0x000000, 0x0ef76e, 0x0ef76e, 0x377fda, 0x000000, 0x000001,
402bbb13a195ca Alexandre Mergnat 2024-07-22  164  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  165  
402bbb13a195ca Alexandre Mergnat 2024-07-22  166  	static const struct {
402bbb13a195ca Alexandre Mergnat 2024-07-22  167  		const u32 *coef;
402bbb13a195ca Alexandre Mergnat 2024-07-22  168  		unsigned int cnt;
402bbb13a195ca Alexandre Mergnat 2024-07-22  169  	} iir_coef_tbl_list[8] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  170  		/* 0: 0.9188 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  171  		{ IIR_COEF_48_TO_44p1, ARRAY_SIZE(IIR_COEF_48_TO_44p1) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  172  		/* 1: 0.7256 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  173  		{ IIR_COEF_44p1_TO_32, ARRAY_SIZE(IIR_COEF_44p1_TO_32) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  174  		/* 2: 0.6667 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  175  		{ IIR_COEF_48_TO_32, ARRAY_SIZE(IIR_COEF_48_TO_32) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  176  		/* 3: 0.5 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  177  		{ IIR_COEF_32_TO_16, ARRAY_SIZE(IIR_COEF_32_TO_16) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  178  		/* 4: 0.4594 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  179  		{ IIR_COEF_96_TO_44p1, ARRAY_SIZE(IIR_COEF_96_TO_44p1) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  180  		/* 5: 0.3628 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  181  		{ IIR_COEF_44p1_TO_16, ARRAY_SIZE(IIR_COEF_44p1_TO_16) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  182  		/* 6: 0.3333 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  183  		{ IIR_COEF_48_TO_16, ARRAY_SIZE(IIR_COEF_48_TO_16) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  184  		/* 7: 0.1667 */
402bbb13a195ca Alexandre Mergnat 2024-07-22  185  		{ IIR_COEF_96_TO_16, ARRAY_SIZE(IIR_COEF_96_TO_16) },
402bbb13a195ca Alexandre Mergnat 2024-07-22  186  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  187  
402bbb13a195ca Alexandre Mergnat 2024-07-22  188  	static const u32 freq_new_index[16] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  189  		0, 1, 2, 99, 3, 4, 5, 99, 6, 7, 8, 9, 10, 11, 12, 99
402bbb13a195ca Alexandre Mergnat 2024-07-22  190  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  191  
402bbb13a195ca Alexandre Mergnat 2024-07-22  192  	static const u32 iir_coef_tbl_matrix[13][13] = {
402bbb13a195ca Alexandre Mergnat 2024-07-22  193  		{/*0*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  194  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  195  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  196  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  197  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  198  		{/*1*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  199  			1, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  200  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  201  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  202  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  203  		{/*2*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  204  			2, 0, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  205  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  206  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  207  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  208  		{/*3*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  209  			3, IIR_INV_COEF, IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  210  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  211  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  212  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  213  		{/*4*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  214  			5, 3, IIR_INV_COEF, 2, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  215  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  216  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  217  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  218  		{/*5*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  219  			6, 4, 3, 2, 0, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  220  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  221  			IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  222  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  223  		{/*6*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  224  			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 3, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  225  			IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  226  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  227  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  228  		{/*7*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  229  			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 5, 3,
402bbb13a195ca Alexandre Mergnat 2024-07-22  230  			IIR_INV_COEF, 1, IIR_NO_NEED, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  231  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  232  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  233  		{/*8*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  234  			7, IIR_INV_COEF, IIR_INV_COEF, 6, 4, 3, 2, 0, IIR_NO_NEED,
402bbb13a195ca Alexandre Mergnat 2024-07-22  235  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  236  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  237  		{/*9*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  238  			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  239  			IIR_INV_COEF, IIR_INV_COEF, 5, 3, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  240  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  241  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  242  		{/*10*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  243  			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 7, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  244  			IIR_INV_COEF, 6, 4, 3, 0,
402bbb13a195ca Alexandre Mergnat 2024-07-22  245  			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  246  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  247  		{ /*11*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  248  			IIR_RATIOVER, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  249  			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  250  			IIR_INV_COEF, 3, IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  251  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  252  		{/*12*/
402bbb13a195ca Alexandre Mergnat 2024-07-22  253  			IIR_RATIOVER, IIR_RATIOVER, IIR_INV_COEF, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  254  			IIR_INV_COEF, IIR_INV_COEF, 7, IIR_INV_COEF,
402bbb13a195ca Alexandre Mergnat 2024-07-22  255  			IIR_INV_COEF, 4, 3, 0, IIR_NO_NEED
402bbb13a195ca Alexandre Mergnat 2024-07-22  256  		},
402bbb13a195ca Alexandre Mergnat 2024-07-22  257  	};
402bbb13a195ca Alexandre Mergnat 2024-07-22  258  
402bbb13a195ca Alexandre Mergnat 2024-07-22  259  	const u32 *coef = NULL;
402bbb13a195ca Alexandre Mergnat 2024-07-22  260  	unsigned int cnt = 0;
402bbb13a195ca Alexandre Mergnat 2024-07-22  261  	u32 i = freq_new_index[input_fs];
402bbb13a195ca Alexandre Mergnat 2024-07-22  262  	u32 j = freq_new_index[output_fs];
402bbb13a195ca Alexandre Mergnat 2024-07-22  263  
402bbb13a195ca Alexandre Mergnat 2024-07-22  264  	if (i < 13 && j < 13) {
402bbb13a195ca Alexandre Mergnat 2024-07-22  265  		u32 k = iir_coef_tbl_matrix[i][j];
402bbb13a195ca Alexandre Mergnat 2024-07-22  266  
402bbb13a195ca Alexandre Mergnat 2024-07-22  267  		if (k >= IIR_NO_NEED) {
402bbb13a195ca Alexandre Mergnat 2024-07-22  268  		} else if (k == IIR_RATIOVER) {
402bbb13a195ca Alexandre Mergnat 2024-07-22  269  		} else if (k == IIR_INV_COEF) {
402bbb13a195ca Alexandre Mergnat 2024-07-22  270  		} else {
402bbb13a195ca Alexandre Mergnat 2024-07-22 @271  			coef = iir_coef_tbl_list[k].coef;
402bbb13a195ca Alexandre Mergnat 2024-07-22  272  			cnt = iir_coef_tbl_list[k].cnt;
402bbb13a195ca Alexandre Mergnat 2024-07-22  273  		}
402bbb13a195ca Alexandre Mergnat 2024-07-22  274  	}
402bbb13a195ca Alexandre Mergnat 2024-07-22  275  	*count = cnt;
402bbb13a195ca Alexandre Mergnat 2024-07-22  276  	return coef;
402bbb13a195ca Alexandre Mergnat 2024-07-22  277  }
402bbb13a195ca Alexandre Mergnat 2024-07-22  278  

:::::: The code at line 271 was first introduced by commit
:::::: 402bbb13a195caa83b3279ebecdabfb11ddee084 ASoC: mediatek: mt8365: Add I2S DAI support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
