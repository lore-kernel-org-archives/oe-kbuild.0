Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106186329
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 01:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777771614; cv=none; b=ZKWUpe1L/gCqaLrYmvbXiClQOVMnUVfsU1TSxCJdN2plVDAqcemXRUD9ZE2pWMpslZE25YGu3d5Df4TYCdoui/vn22slQ/CaSu7HD+dWI5Nikcuqc2io74oPA7lYYOsx1zOJvwDEQ8AAurnCYB1K090kScZuli1hVe2kNqSrDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777771614; c=relaxed/simple;
	bh=W0rAtEsD5hWRGNqiKx3U4xTwEsDty4jzCsjLlBMKuL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZFrVB7lmmNiICHIAS/1nTDDTBX/hszBl6+ozFFpSoHEVBOhLXNR1chotxTDdU1lFTK8gOKJKcvLCVR12AmEhP1rxHildFvEH89/jy55yg7YWKwfLdj9mgt957MTw0tMJpVqYqxjXcSHCZ8umMvDud/ScONOkOCtrQmdr1N2k0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKWA8NPg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKWA8NPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777771612; x=1809307612;
  h=date:from:to:cc:subject:message-id;
  bh=W0rAtEsD5hWRGNqiKx3U4xTwEsDty4jzCsjLlBMKuL8=;
  b=JKWA8NPgGrLk07Vw8jIsy335cQxINtCy5QT9eqMNXNc4MfDiZDEs+21v
   UbBDnj8psX2QqTjFzJvKvOUWI2Vz+bPZ9R1L+VzKZUCdLLFmssAf6Zs7r
   Dawd8dEI7vMqNOa+3tcLyj3+Hmf9xrf9mjIoqNzzIGdz6lh515zHAvG0t
   7xw6OverY1XOLD2AUKO9qoXQ2SktiPE4M1pu4gS+XBvOootG5FnWqz090
   ZvQAGUBAU+cVQh/SFXsUqsh7Bbi5yp12nxPRuEwZrzEDO5x1jTIWRsz1e
   wx6FUna3ju/IsACAu4VfL4+mx7cDG2GEIClVvKZqg/CSBTI2iImcA/lVK
   Q==;
X-CSE-ConnectionGUID: trAqRs6QS/aX5ofycZsb0A==
X-CSE-MsgGUID: qPpG9q4mQaWmR7N+2EffVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78672351"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78672351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 18:26:52 -0700
X-CSE-ConnectionGUID: vKs2oOItStSA9zRs/odo1Q==
X-CSE-MsgGUID: wOw82LgyTQu0r0ntpAy+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258803250"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 May 2026 18:26:50 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJLbc-000000001zD-1Y0L;
	Sun, 03 May 2026 01:26:48 +0000
Date: Sun, 03 May 2026 09:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/crypto/ccp/sev-dev.c:2165:17: warning: variable
 'error' set but not used
Message-ID: <202605030945.YIHLtf1J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Tycho-Andersen/crypto-ccp-Hoist-kernel-part-of-SNP_PLATFORM_STATUS/20260502-181408, commit: 61b6850d2a4e7abc1dc7b500a6786191f7fad8d3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Tycho Andersen (AMD)" <tycho@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tycho-Andersen/crypto-ccp-Hoist-kernel-part-of-SNP_PLATFORM_STATUS/20260502-181408
head:   61b6850d2a4e7abc1dc7b500a6786191f7fad8d3
commit: 61b6850d2a4e7abc1dc7b500a6786191f7fad8d3 crypto/ccp: Implement SNP firmware live update
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260503/202605030945.YIHLtf1J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030945.YIHLtf1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030945.YIHLtf1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/sev-dev.c: In function 'sev_fw_upload_write':
>> drivers/crypto/ccp/sev-dev.c:2165:17: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    2165 |         int rc, error = 0;
         |                 ^~~~~


vim +/error +2165 drivers/crypto/ccp/sev-dev.c

61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2158) 
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2159) static enum fw_upload_err sev_fw_upload_write(struct fw_upload *fw_upload,
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2160) 					      const u8 *data, u32 offset,
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2161) 					      u32 size, u32 *written)
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2162) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2163) 	struct sev_device *sev = fw_upload->dd_handle;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2164) 	u8 old_major, old_minor, old_build;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30 @2165) 	int rc, error = 0;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2166) 	enum fw_upload_err ret;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2167) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2168) 	if (offset != 0)
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2169) 		return FW_UPLOAD_ERR_INVALID_SIZE;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2170) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2171) 	old_major = sev->api_major;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2172) 	old_minor = sev->api_minor;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2173) 	old_build = sev->build;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2174) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2175) 	mutex_lock(&sev_cmd_mutex);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2176) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2177) 	/*
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2178) 	 * If the last firmware update returned RESTORE_REQUIRED, allow only
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2179) 	 * this DLFWEX command so the admin can restore the previous FW
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2180) 	 * version. If we are in this state the legacy firmware has previously
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2181) 	 * been shut down, so no need to do it again.
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2182) 	 */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2183) 	if (dlfwex_wants_rollback && psp_dead) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2184) 		dlfwex_wants_rollback = false;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2185) 		psp_dead = false;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2186) 	} else {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2187) 		rc = sev_firmware_shutdown_if_sev_initialized(sev);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2188) 		if (rc) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2189) 			ret = FW_UPLOAD_ERR_BUSY;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2190) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2191) 		}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2192) 	}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2193) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2194) 	rc = sev_download_firmware_ex(sev, data, size);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2195) 	if (rc) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2196) 		ret = FW_UPLOAD_ERR_FW_INVALID;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2197) 		switch (rc) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2198) 		case SEV_RET_INVALID_PLATFORM_STATE:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2199) 			fallthrough;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2200) 		case SEV_RET_INVALID_ADDRESS:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2201) 			/* these are probably kernel bugs */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2202) 			WARN_ON_ONCE(true);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2203) 			ret = FW_UPLOAD_ERR_BUSY;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2204) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2205) 		case SEV_RET_INVALID_LEN:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2206) 			ret = FW_UPLOAD_ERR_INVALID_SIZE;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2207) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2208) 		case SEV_RET_INVALID_PARAM:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2209) 			dev_err(sev->dev, "SEV firmware image is not well formed\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2210) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2211) 		case SEV_RET_SHUTDOWN_REQUIRED:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2212) 			dev_err(sev->dev, "SEV firmware too far, shutdown required\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2213) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2214) 		case SEV_RET_INVALID_CONFIG:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2215) 			dev_err(sev->dev, "SEV firmware upgrade would rollback SVN\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2216) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2217) 		case SEV_RET_BAD_SIGNATURE:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2218) 			dev_err(sev->dev, "SEV firmware upgrade bad signature\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2219) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2220) 		case SEV_RET_BAD_VERSION:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2221) 			dev_err(sev->dev, "SEV firmware upgrade less than CommittedVersion\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2222) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2223) 		case SEV_RET_UNSUPPORTED:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2224) 			dev_err(sev->dev, "SEV firmware required feature not supported\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2225) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2226) 		case SEV_RET_UPDATE_FAILED:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2227) 			/*
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2228) 			 * Update failed but fw rolled back on its own,
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2229) 			 * operation can continue normally.
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2230) 			 */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2231) 			dev_err(sev->dev, "SEV firmware update failed\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2232) 			ret = FW_UPLOAD_ERR_HW_ERROR;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2233) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2234) 		case SEV_RET_HWSEV_RET_UNSAFE:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2235) 			/*
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2236) 			 * "Following a return of HARDWARE_UNSAFE, operation of
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2237) 			 * the SEV firmware is indeterminate
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2238) 			 * and the recommendation is to reboot the platform."
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2239) 			 */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2240) 			dev_err(sev->dev, "SEV firmware no longer safe to operate\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2241) 			psp_dead = true;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2242) 			ret = FW_UPLOAD_ERR_HW_ERROR;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2243) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2244) 		case SEV_RET_RESTORE_REQUIRED:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2245) 			/*
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2246) 			 * FW asked us to roll back; we don't hold onto the
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2247) 			 * last FW image, so we can't. We can set a flag to
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2248) 			 * allow the admin to rollback if they happen to have
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2249) 			 * the old firmware image handy.
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2250) 			 */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2251) 			dev_err(sev->dev, "SEV firmware update failed, please roll back\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2252) 			psp_dead = true;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2253) 			dlfwex_wants_rollback = true;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2254) 			ret = FW_UPLOAD_ERR_HW_ERROR;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2255) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2256) 		default:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2257) 			dev_err(sev->dev, "Unknown SEV firmware err %d\n", rc);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2258) 			ret = FW_UPLOAD_ERR_HW_ERROR;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2259) 			goto unlock;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2260) 		}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2261) 	}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2262) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2263) 	*written = size;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2264) 	ret = FW_UPLOAD_ERR_NONE;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2265) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2266) unlock:
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2267) 	mutex_unlock(&sev_cmd_mutex);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2268) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2269) 	/*
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2270) 	 * sev_get_api_version() updates the SEV and SNP statuses, SNP feature
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2271) 	 * info if available, build numbers, etc. cached in struct sev_device.
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2272) 	 * Update these if they may have changed for new firmware.
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2273) 	 */
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2274) 	if (ret == FW_UPLOAD_ERR_NONE) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2275) 		error = 0;
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2276) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2277) 		rc = sev_get_api_version();
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2278) 		if (rc) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2279) 			dev_warn(sev->dev,
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2280) 				 "SNP platform data refresh after firmware update failed %d\n",
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2281) 				 rc);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2282) 		} else if (sev->api_major != old_major ||
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2283) 			   sev->api_minor != old_minor ||
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2284) 			   sev->build != old_build) {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2285) 			dev_info(sev->dev, "SEV firmware updated to %d.%d build %d\n",
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2286) 				 sev->api_major, sev->api_minor, sev->build);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2287) 		} else {
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2288) 			dev_info(sev->dev, "SEV firmware not updated\n");
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2289) 		}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2290) 	}
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2291) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2292) 	if (!dlfwex_wants_rollback)
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2293) 		sev_firmware_reinit_if_shutdown(sev);
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2294) 
61b6850d2a4e7ab Tycho Andersen (AMD  2026-04-30  2295) 	return ret;
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2296) }
73075bd1509db25 Tycho Andersen (AMD  2026-04-30  2297) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
