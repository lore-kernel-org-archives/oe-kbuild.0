Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1E239E6B
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526519; cv=none; b=nia9pfUNvq9IWwV/0oZTw4qZe2lnMaKUGMKZpvspJNhrXUOxXdoYRNdcPOOwWIW1x+gKLLYXkXBmcy7M8y4h4ALazsP3qiMs7dze6iAgP3Exvg7YuodkjZrvLPSdfBJlajmphfqZ+MZbHsFxC/JfC+/P55ZJuSV+K3wYV25HLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526519; c=relaxed/simple;
	bh=kuwjWA1X+o51L/IZy0q2IZYHDYyyvxCDU/FjJjYabeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrWw2XJsEGejy81oMVVJ6ABHuE0RQ3ELHZVCXPjyrwFnW7YupBLPT2jStUbkpYpDqB4UMkVkaqeUCu3kSok2mvtxI6oUdkuz1FArtXQTWD5B4Bdt87tJaHbX17HwkGI+RyFKgxYExhFlDgNjfqvr1dmQ/apdZIT3wyxojfpcH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgS0K5NI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgS0K5NI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752526517; x=1784062517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kuwjWA1X+o51L/IZy0q2IZYHDYyyvxCDU/FjJjYabeo=;
  b=YgS0K5NIhoHF9+PaBq9WBTVNI515lzl6z9aIRo1DHqQXT6EOE33mrCdf
   xNkIxQ/a5t0RzgLWqlXCt2b+HlhfJXV5BtTuIhT0D7DWdaPbUvKLftB3R
   NpGFQCjr/736DQhstbjUSJgijq2z/hL7IoPqL6/qak+1knRzeNb5fpb0O
   pDkuzOxr0CbdF4KWKQEJizfCCm8AZbyZ7aET5xINtdFlrJ0oZ7HfCU6j9
   fExnxGXpNXGdkZeqwc6UdIzivai3UubNRqNLxyZmuVUORKVPzqL5D/KDE
   7y2hWCWlK4ssQmScJjZfTeQmL392DttIZ8Lpe5orWJX8SE+yaZOBpKHPW
   w==;
X-CSE-ConnectionGUID: HVYkp5RZRRe5jbofaKVewg==
X-CSE-MsgGUID: 8hbRhMVGQkye8Z07Cusorw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54601644"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54601644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 13:55:16 -0700
X-CSE-ConnectionGUID: icTpOw7+TO61kuyDGJ3ZyA==
X-CSE-MsgGUID: 4VyS1JRjTL6j2s7xe/uNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="162582686"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2025 13:55:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQCe-0009Kt-2z;
	Mon, 14 Jul 2025 20:55:12 +0000
Date: Tue, 15 Jul 2025 04:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:for-next 114/139] sound/hda/codecs/ca0132.c:2427
 dspio_scp() error: we previously assumed 'reply_len' could be null (see line
 2390)
Message-ID: <202507150723.UdvLgOhX-lkp@intel.com>
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
CC: alsa-devel@alsa-project.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   891667cefd16e71cd847c75dbdc272acd996bb68
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 [114/139] ALSA: hda: Move codec drivers into sound/hda/codecs directory
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150723.UdvLgOhX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150723.UdvLgOhX-lkp@intel.com/

smatch warnings:
sound/hda/codecs/ca0132.c:2427 dspio_scp() error: we previously assumed 'reply_len' could be null (see line 2390)
sound/hda/codecs/ca0132.c:8618 ca0132_download_dsp_images() error: we previously assumed 'fw_entry' could be null (see line 8611)
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.

vim +/reply_len +2427 sound/hda/codecs/ca0132.c

01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2354  
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2355  /**
3531ba21f5520d0 sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2021-03-01  2356   * dspio_scp - Prepare and send the SCP message to DSP
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2357   * @codec: the HDA codec
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2358   * @mod_id: ID of the DSP module to send the command
4f5c26534d395bf sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2020-01-13  2359   * @src_id: ID of the source
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2360   * @req: ID of request to send to the DSP module
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2361   * @dir: SET or GET
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2362   * @data: pointer to the data to send with the request, request specific
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2363   * @len: length of the data, in bytes
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2364   * @reply: point to the buffer to hold data returned for a reply
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2365   * @reply_len: length of the reply buffer returned from GET
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2366   *
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2367   * Returns zero or a negative error code.
d5c21b88e8df070 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2368   */
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2369  static int dspio_scp(struct hda_codec *codec,
447fd8e9a88e466 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2370  		int mod_id, int src_id, int req, int dir, const void *data,
447fd8e9a88e466 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2371  		unsigned int len, void *reply, unsigned int *reply_len)
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2372  {
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2373  	int status = 0;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2374  	struct scp_msg scp_send, scp_reply;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2375  	unsigned int ret_bytes, send_size, ret_size;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2376  	unsigned int send_get_flag, reply_resp_flag, reply_error_flag;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2377  	unsigned int reply_data_size;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2378  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2379  	memset(&scp_send, 0, sizeof(scp_send));
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2380  	memset(&scp_reply, 0, sizeof(scp_reply));
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2381  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2382  	if ((len != 0 && data == NULL) || (len > SCP_MAX_DATA_WORDS))
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2383  		return -EINVAL;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2384  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2385  	if (dir == SCP_GET && reply == NULL) {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2386  		codec_dbg(codec, "dspio_scp get but has no buffer\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2387  		return -EINVAL;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2388  	}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2389  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2390  	if (reply != NULL && (reply_len == NULL || (*reply_len == 0))) {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2391  		codec_dbg(codec, "dspio_scp bad resp buf len parms\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2392  		return -EINVAL;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2393  	}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2394  
447fd8e9a88e466 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2395  	scp_send.hdr = make_scp_header(mod_id, src_id, (dir == SCP_GET), req,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2396  				       0, 0, 0, len/sizeof(unsigned int));
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2397  	if (data != NULL && len > 0) {
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2398  		len = min((unsigned int)(sizeof(scp_send.data)), len);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2399  		memcpy(scp_send.data, data, len);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2400  	}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2401  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2402  	ret_bytes = 0;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2403  	send_size = sizeof(unsigned int) + len;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2404  	status = dspio_send_scp_message(codec, (unsigned char *)&scp_send,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2405  					send_size, (unsigned char *)&scp_reply,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2406  					sizeof(scp_reply), &ret_bytes);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2407  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2408  	if (status < 0) {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2409  		codec_dbg(codec, "dspio_scp: send scp msg failed\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2410  		return status;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2411  	}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2412  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2413  	/* extract send and reply headers members */
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2414  	extract_scp_header(scp_send.hdr, NULL, NULL, &send_get_flag,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2415  			   NULL, NULL, NULL, NULL, NULL);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2416  	extract_scp_header(scp_reply.hdr, NULL, NULL, NULL, NULL, NULL,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2417  			   &reply_resp_flag, &reply_error_flag,
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2418  			   &reply_data_size);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2419  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2420  	if (!send_get_flag)
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2421  		return 0;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2422  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2423  	if (reply_resp_flag && !reply_error_flag) {
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2424  		ret_size = (ret_bytes - sizeof(scp_reply.hdr))
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2425  					/ sizeof(unsigned int);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2426  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2427  		if (*reply_len < ret_size*sizeof(unsigned int)) {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2428  			codec_dbg(codec, "reply too long for buf\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2429  			return -EINVAL;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2430  		} else if (ret_size != reply_data_size) {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2431  			codec_dbg(codec, "RetLen and HdrLen .NE.\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2432  			return -EINVAL;
46a049dae771b95 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2433  		} else if (!reply) {
46a049dae771b95 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2434  			codec_dbg(codec, "NULL reply\n");
46a049dae771b95 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2435  			return -EINVAL;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2436  		} else {
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2437  			*reply_len = ret_size*sizeof(unsigned int);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2438  			memcpy(reply, scp_reply.data, *reply_len);
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2439  		}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2440  	} else {
4e76a8833fac8dc sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2441  		codec_dbg(codec, "reply ill-formed or errflag set\n");
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2442  		return -EIO;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2443  	}
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2444  
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2445  	return status;
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2446  }
01ef7dbffb411d9 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2447  

:::::: The code at line 2427 was first introduced by commit
:::::: 01ef7dbffb411d9d78d1150b268d9c757f9f2f93 ALSA: hda - Update CA0132 codec to load DSP firmware binary

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
