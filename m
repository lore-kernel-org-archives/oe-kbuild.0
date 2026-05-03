Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71B12D1F1
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777800876; cv=none; b=BR9vpF2zCCRvVnMJyilPIoYy8n7f9hNPMpRtU24Qrjy27d6o9MGJ0eNbZZIOlsh3c2izaK2bfYcdY0O3fRdIqvrGE1bESSCJbDXl1Z2CXOEFIj21Y0oGupSkztuGdaUWvhStde/AD8tovtfUSXG+5OmILa+me3NYnZPmZsPnq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777800876; c=relaxed/simple;
	bh=e0llW31BbQ5f/xTRV5xMQeY/60vJWVhQ69FdmsCDCU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ehYJ1lhKo7+yWWipjbYxSAmzFM4KC9NNXGWTBdFxbJWsw03t6A5mr85rrHql5PfmaY5ZAemw+G9lSwSlixucDVFy5rweMslHERtahYB9M5Ftv7YaFEM2ytgRqraFSpLIwpHeeuKoqvkSh36zYytag9Hg290oX2fHKQgiNPEa0mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvlGctSu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvlGctSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777800874; x=1809336874;
  h=date:from:to:cc:subject:message-id;
  bh=e0llW31BbQ5f/xTRV5xMQeY/60vJWVhQ69FdmsCDCU8=;
  b=cvlGctSujbAJ9BRuBD5NKCn9i2wQWRA6oKhY5UEFyJfAc/FMYh2VcuYn
   /qKYzdG6tieuy5NWG+fHMBDdH0dNdfPXIqB2ZfHAeMpsRKpgkazjcywIE
   5iusb+trfTXhVOyC4fczPHTCV4pnzXreNQIYjlLTqYHPdzYi+GRvrW/EU
   FaGs/WBRzKX49niQIgnOrHn0M9SQBjc8zij9gOMkcxIws7TS5kac1q7K/
   RhfIRPxtvR++TSsme42rxI6ESkoyEdKQFuLhstRzhyLuaC2V+RwLqom19
   Qh2xsERbOdu7QYjq1VjPlLEHKRcVuikSC6Berfhfy9LQYPwHIDKqeD80l
   A==;
X-CSE-ConnectionGUID: nc7SMMhgSya3QZfxgSUmxg==
X-CSE-MsgGUID: uKXlfkshRiaf65BuYDXXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89278628"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89278628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 02:34:34 -0700
X-CSE-ConnectionGUID: qHJoC7g3RM+28vSWbonn0Q==
X-CSE-MsgGUID: BlDAISzaRYycTfIwsGaOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235511015"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2026 02:34:32 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJTDa-000000002Pd-0i1X;
	Sun, 03 May 2026 09:34:30 +0000
Date: Sun, 03 May 2026 17:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:1921:13: warning: stack
 frame size (2096) exceeds limit (2048) in
 'vcap_api_next_lookup_advanced_test'
Message-ID: <202605031718.CnB5RzyP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602, commit: 17d48914af56c0c9e50994a1383f9d3bdf8b00b1"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Byungchul Park <byungchul@sk.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602
head:   46b72c93953595c42867a65ad4829f753ef95b8e
commit: 17d48914af56c0c9e50994a1383f9d3bdf8b00b1 dept: tie to lockdep and IRQ tracing
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605031718.CnB5RzyP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031718.CnB5RzyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605031718.CnB5RzyP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/microchip/vcap/vcap_api.c:3610:
>> drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:1921:13: warning: stack frame size (2096) exceeds limit (2048) in 'vcap_api_next_lookup_advanced_test' [-Wframe-larger-than]
   static void vcap_api_next_lookup_advanced_test(struct kunit *test)
               ^
   136/2096 (6.49%) spills, 1960/2096 (93.51%) variables
   1 warning generated.
--
>> drivers/gpu/drm/panel/panel-novatek-nt35560.c:280:12: warning: stack frame size (2128) exceeds limit (2048) in 'nt35560_prepare' [-Wframe-larger-than]
   static int nt35560_prepare(struct drm_panel *panel)
              ^
   112/2128 (5.26%) spills, 2016/2128 (94.74%) variables
   1 warning generated.


vim +/vcap_api_next_lookup_advanced_test +1921 drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c

c956b9b318d903 Steen Hegelund 2022-11-09  1920  
c956b9b318d903 Steen Hegelund 2022-11-09 @1921  static void vcap_api_next_lookup_advanced_test(struct kunit *test)
c956b9b318d903 Steen Hegelund 2022-11-09  1922  {
129ff4de58ff0c Arnd Bergmann  2023-02-17  1923  	struct vcap_admin admin[] = {
129ff4de58ff0c Arnd Bergmann  2023-02-17  1924  	{
c956b9b318d903 Steen Hegelund 2022-11-09  1925  		.vtype = VCAP_TYPE_IS0,
c956b9b318d903 Steen Hegelund 2022-11-09  1926  		.vinst = 0,
c956b9b318d903 Steen Hegelund 2022-11-09  1927  		.first_cid = 1000000,
c956b9b318d903 Steen Hegelund 2022-11-09  1928  		.last_cid =  1199999,
c956b9b318d903 Steen Hegelund 2022-11-09  1929  		.lookups = 6,
c956b9b318d903 Steen Hegelund 2022-11-09  1930  		.lookups_per_instance = 2,
129ff4de58ff0c Arnd Bergmann  2023-02-17  1931  	}, {
c956b9b318d903 Steen Hegelund 2022-11-09  1932  		.vtype = VCAP_TYPE_IS0,
c956b9b318d903 Steen Hegelund 2022-11-09  1933  		.vinst = 1,
c956b9b318d903 Steen Hegelund 2022-11-09  1934  		.first_cid = 1200000,
c956b9b318d903 Steen Hegelund 2022-11-09  1935  		.last_cid =  1399999,
c956b9b318d903 Steen Hegelund 2022-11-09  1936  		.lookups = 6,
c956b9b318d903 Steen Hegelund 2022-11-09  1937  		.lookups_per_instance = 2,
129ff4de58ff0c Arnd Bergmann  2023-02-17  1938  	}, {
c956b9b318d903 Steen Hegelund 2022-11-09  1939  		.vtype = VCAP_TYPE_IS0,
c956b9b318d903 Steen Hegelund 2022-11-09  1940  		.vinst = 2,
c956b9b318d903 Steen Hegelund 2022-11-09  1941  		.first_cid = 1400000,
c956b9b318d903 Steen Hegelund 2022-11-09  1942  		.last_cid =  1599999,
c956b9b318d903 Steen Hegelund 2022-11-09  1943  		.lookups = 6,
c956b9b318d903 Steen Hegelund 2022-11-09  1944  		.lookups_per_instance = 2,
129ff4de58ff0c Arnd Bergmann  2023-02-17  1945  	}, {
c956b9b318d903 Steen Hegelund 2022-11-09  1946  		.vtype = VCAP_TYPE_IS2,
c956b9b318d903 Steen Hegelund 2022-11-09  1947  		.vinst = 0,
c956b9b318d903 Steen Hegelund 2022-11-09  1948  		.first_cid = 8000000,
c956b9b318d903 Steen Hegelund 2022-11-09  1949  		.last_cid = 8199999,
c956b9b318d903 Steen Hegelund 2022-11-09  1950  		.lookups = 4,
c956b9b318d903 Steen Hegelund 2022-11-09  1951  		.lookups_per_instance = 2,
129ff4de58ff0c Arnd Bergmann  2023-02-17  1952  	}, {
c956b9b318d903 Steen Hegelund 2022-11-09  1953  		.vtype = VCAP_TYPE_IS2,
c956b9b318d903 Steen Hegelund 2022-11-09  1954  		.vinst = 1,
c956b9b318d903 Steen Hegelund 2022-11-09  1955  		.first_cid = 8200000,
c956b9b318d903 Steen Hegelund 2022-11-09  1956  		.last_cid = 8399999,
c956b9b318d903 Steen Hegelund 2022-11-09  1957  		.lookups = 4,
c956b9b318d903 Steen Hegelund 2022-11-09  1958  		.lookups_per_instance = 2,
129ff4de58ff0c Arnd Bergmann  2023-02-17  1959  	}
c956b9b318d903 Steen Hegelund 2022-11-09  1960  	};
c956b9b318d903 Steen Hegelund 2022-11-09  1961  	bool ret;
c956b9b318d903 Steen Hegelund 2022-11-09  1962  
129ff4de58ff0c Arnd Bergmann  2023-02-17  1963  	vcap_test_api_init(&admin[0]);
129ff4de58ff0c Arnd Bergmann  2023-02-17  1964  	list_add_tail(&admin[1].list, &test_vctrl.list);
129ff4de58ff0c Arnd Bergmann  2023-02-17  1965  	list_add_tail(&admin[2].list, &test_vctrl.list);
129ff4de58ff0c Arnd Bergmann  2023-02-17  1966  	list_add_tail(&admin[3].list, &test_vctrl.list);
129ff4de58ff0c Arnd Bergmann  2023-02-17  1967  	list_add_tail(&admin[4].list, &test_vctrl.list);
c956b9b318d903 Steen Hegelund 2022-11-09  1968  
c956b9b318d903 Steen Hegelund 2022-11-09  1969  	ret = vcap_is_next_lookup(&test_vctrl, 1000000, 1001000);
c956b9b318d903 Steen Hegelund 2022-11-09  1970  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1971  	ret = vcap_is_next_lookup(&test_vctrl, 1000000, 1101000);
c956b9b318d903 Steen Hegelund 2022-11-09  1972  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1973  
c956b9b318d903 Steen Hegelund 2022-11-09  1974  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 1201000);
c956b9b318d903 Steen Hegelund 2022-11-09  1975  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1976  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 1301000);
784c3067d094dd Steen Hegelund 2023-01-14  1977  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1978  	ret = vcap_is_next_lookup(&test_vctrl, 1100000, 8101000);
784c3067d094dd Steen Hegelund 2023-01-14  1979  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1980  	ret = vcap_is_next_lookup(&test_vctrl, 1300000, 1401000);
c956b9b318d903 Steen Hegelund 2022-11-09  1981  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1982  	ret = vcap_is_next_lookup(&test_vctrl, 1400000, 1501000);
c956b9b318d903 Steen Hegelund 2022-11-09  1983  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1984  	ret = vcap_is_next_lookup(&test_vctrl, 1500000, 8001000);
c956b9b318d903 Steen Hegelund 2022-11-09  1985  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1986  
c956b9b318d903 Steen Hegelund 2022-11-09  1987  	ret = vcap_is_next_lookup(&test_vctrl, 8000000, 8001000);
c956b9b318d903 Steen Hegelund 2022-11-09  1988  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1989  	ret = vcap_is_next_lookup(&test_vctrl, 8000000, 8101000);
c956b9b318d903 Steen Hegelund 2022-11-09  1990  	KUNIT_EXPECT_EQ(test, true, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1991  
c956b9b318d903 Steen Hegelund 2022-11-09  1992  	ret = vcap_is_next_lookup(&test_vctrl, 8300000, 8301000);
c956b9b318d903 Steen Hegelund 2022-11-09  1993  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1994  	ret = vcap_is_next_lookup(&test_vctrl, 8300000, 8401000);
784c3067d094dd Steen Hegelund 2023-01-14  1995  	KUNIT_EXPECT_EQ(test, false, ret);
c956b9b318d903 Steen Hegelund 2022-11-09  1996  }
c956b9b318d903 Steen Hegelund 2022-11-09  1997  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
