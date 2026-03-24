Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7171A9F85
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314393; cv=none; b=J5IaHJo4D3zourFXPz6GXvQhbIxvkguXIu9NT6WJe7QKMklneEHKSLY223nV+PI0aXnIShenMtYIJIMErRVzmqTuDGUmUXsdHspxLUG+Pb0dbyC1Wu2rUh8aX8TUm5s1R41mtxC6tbQy2PHhs4uP2/tbmUwbC+YCFslXZzzT4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314393; c=relaxed/simple;
	bh=H290rjtxvn2A1Z5vpnn0W1WlEh+j+WrEh+10E553rrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GufBELOELlQT1n2bDmFSBh29JEYQSAMgrmzqbWiTYRJFwpNw9wiEXEY8ahO2R9Euymh68S9iy7gi7AN9IGmmkQRh1pp38IP9jtUQmicAVhHdzgICpO1FSXT0TPLQCA2/demj0DjiYfkzfDzdOStgVT97vmTp3zF+3sp6KYTJg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OckQuqZ/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OckQuqZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774314392; x=1805850392;
  h=date:from:to:cc:subject:message-id;
  bh=H290rjtxvn2A1Z5vpnn0W1WlEh+j+WrEh+10E553rrM=;
  b=OckQuqZ/l/7j2d2bHi96kGrwMXu2lFzzb+kboZc6mmho7a1Dj9CqBDST
   HP3K09MpS+VdA8+iBhtNOFFhPacwyF7uyhPWWZWh4iBhUQ1XMLPtwgAFd
   E5yA2smrq0u3U0yLF7XQ9wy/idGgWFckc8v5YMQpzfJjV0wAxwDWMrRCM
   lppJEKXr2osirRu3a4MlOpZQIQwpyVWCisScd+lmzyICVTcaaIzDaIPGv
   ujbLQE1PPiuYje5R3LlojFqU+vaCIz8gn9uNFryf/sp6xobDYeRfoVZNN
   PW9cD0cUey1cv5JFmeO9SUi5r6whe6PbnGbH3a2Lc/2YXf5Ax5dEFq1Ea
   w==;
X-CSE-ConnectionGUID: KibmzMTqQB2+yFq3Nfa1mQ==
X-CSE-MsgGUID: Vljm46wtSKmFzEVdDq425g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74508967"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74508967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:06:30 -0700
X-CSE-ConnectionGUID: 8FVTDE77TDyd7Y8PKPqV+g==
X-CSE-MsgGUID: iwI5g4xXR06Kiv1T+OIgEQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2026 18:06:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qDy-000000003UC-21A1;
	Tue, 24 Mar 2026 01:06:26 +0000
Date: Tue, 24 Mar 2026 09:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/codecs/ca0132.c:2427 dspio_scp() error: we
 previously assumed 'reply_len' could be null (see line 2390)
Message-ID: <202603240950.dMjNG6He-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 ALSA: hda: Move codec drivers into sound/hda/codecs directory
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r071-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240950.dMjNG6He-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240950.dMjNG6He-lkp@intel.com/

New smatch warnings:
sound/hda/codecs/ca0132.c:2427 dspio_scp() error: we previously assumed 'reply_len' could be null (see line 2390)

Old smatch warnings:
sound/hda/codecs/ca0132.c:8618 ca0132_download_dsp_images() error: we previously assumed 'fw_entry' could be null (see line 8611)
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.

vim +/reply_len +2427 sound/hda/codecs/ca0132.c

01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2354  
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2355  /**
3531ba21f5520d sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2021-03-01  2356   * dspio_scp - Prepare and send the SCP message to DSP
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2357   * @codec: the HDA codec
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2358   * @mod_id: ID of the DSP module to send the command
4f5c26534d395b sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2020-01-13  2359   * @src_id: ID of the source
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2360   * @req: ID of request to send to the DSP module
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2361   * @dir: SET or GET
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2362   * @data: pointer to the data to send with the request, request specific
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2363   * @len: length of the data, in bytes
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2364   * @reply: point to the buffer to hold data returned for a reply
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2365   * @reply_len: length of the reply buffer returned from GET
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2366   *
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2367   * Returns zero or a negative error code.
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2368   */
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2369  static int dspio_scp(struct hda_codec *codec,
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2370  		int mod_id, int src_id, int req, int dir, const void *data,
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2371  		unsigned int len, void *reply, unsigned int *reply_len)
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2372  {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2373  	int status = 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2374  	struct scp_msg scp_send, scp_reply;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2375  	unsigned int ret_bytes, send_size, ret_size;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2376  	unsigned int send_get_flag, reply_resp_flag, reply_error_flag;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2377  	unsigned int reply_data_size;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2378  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2379  	memset(&scp_send, 0, sizeof(scp_send));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2380  	memset(&scp_reply, 0, sizeof(scp_reply));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2381  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2382  	if ((len != 0 && data == NULL) || (len > SCP_MAX_DATA_WORDS))
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2383  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2384  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2385  	if (dir == SCP_GET && reply == NULL) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2386  		codec_dbg(codec, "dspio_scp get but has no buffer\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2387  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2388  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2389  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2390  	if (reply != NULL && (reply_len == NULL || (*reply_len == 0))) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2391  		codec_dbg(codec, "dspio_scp bad resp buf len parms\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2392  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2393  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2394  
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2395  	scp_send.hdr = make_scp_header(mod_id, src_id, (dir == SCP_GET), req,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2396  				       0, 0, 0, len/sizeof(unsigned int));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2397  	if (data != NULL && len > 0) {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2398  		len = min((unsigned int)(sizeof(scp_send.data)), len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2399  		memcpy(scp_send.data, data, len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2400  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2401  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2402  	ret_bytes = 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2403  	send_size = sizeof(unsigned int) + len;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2404  	status = dspio_send_scp_message(codec, (unsigned char *)&scp_send,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2405  					send_size, (unsigned char *)&scp_reply,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2406  					sizeof(scp_reply), &ret_bytes);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2407  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2408  	if (status < 0) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2409  		codec_dbg(codec, "dspio_scp: send scp msg failed\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2410  		return status;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2411  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2412  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2413  	/* extract send and reply headers members */
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2414  	extract_scp_header(scp_send.hdr, NULL, NULL, &send_get_flag,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2415  			   NULL, NULL, NULL, NULL, NULL);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2416  	extract_scp_header(scp_reply.hdr, NULL, NULL, NULL, NULL, NULL,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2417  			   &reply_resp_flag, &reply_error_flag,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2418  			   &reply_data_size);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2419  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2420  	if (!send_get_flag)
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2421  		return 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2422  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2423  	if (reply_resp_flag && !reply_error_flag) {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2424  		ret_size = (ret_bytes - sizeof(scp_reply.hdr))
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2425  					/ sizeof(unsigned int);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2426  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2427  		if (*reply_len < ret_size*sizeof(unsigned int)) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2428  			codec_dbg(codec, "reply too long for buf\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2429  			return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2430  		} else if (ret_size != reply_data_size) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2431  			codec_dbg(codec, "RetLen and HdrLen .NE.\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2432  			return -EINVAL;
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2433  		} else if (!reply) {
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2434  			codec_dbg(codec, "NULL reply\n");
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2435  			return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2436  		} else {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2437  			*reply_len = ret_size*sizeof(unsigned int);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2438  			memcpy(reply, scp_reply.data, *reply_len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2439  		}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2440  	} else {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2441  		codec_dbg(codec, "reply ill-formed or errflag set\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2442  		return -EIO;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2443  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2444  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2445  	return status;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2446  }
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2447  

:::::: The code at line 2427 was first introduced by commit
:::::: 01ef7dbffb411d9d78d1150b268d9c757f9f2f93 ALSA: hda - Update CA0132 codec to load DSP firmware binary

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
