Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F941DC9A8
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162174; cv=none; b=jUl3PwfcmKrgcl74Sk+sL0RkhxChw7vmYyVUAh2LY8c6zWm8ve8hfZBHJayWbm4T4MeNcZ6mjBJiN/8X4k3XPgJLzo51VPPNbavJ/7QAodJWqomgXUPOIt1TRhKR4jxJkfEdG7bfyXa/qLZDmOgv4DeNgNqsljiPt8Jhb1UjbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162174; c=relaxed/simple;
	bh=O6C2GYZ1nSXjyomoMWBLCOezNaTin34/+fcjikzbwuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwZlAhthdCfJkvy1Rr1i4qxtGoqGb9NQ/KsZk9gYAkZo7MenWbM1rOeyjXSYI309T2kFGb/zUyMxfDGB94dRhpOSaRJPYct8Zz8/I5vjCPnZbr3fscwkQO9MR1L/jVBOteiajrLGGCvu0+mXe+vZSDUeb8rY9SAX+32L2Pu5SnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTNlDKob; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTNlDKob"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4368a293339so109366885e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736162170; x=1736766970; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAGnL/Jk0mHfwFhTVnY/JknA1BlI/NlBEd64HszCM=;
        b=bTNlDKobRxpg8JW5kue3HkLXsLbpwKBa25YUuZsJuL34V6NjhUcAegKSIRpIMK1dBc
         gklxTp5aPgEKL26Eu3lt/kC0I3PkF+kQf60K0X1fOJDa969M0byZs3vpDCLPCOGZhA6i
         b83S81wV1C5S0m3+xv9e3FZN61ZuPcx+TA8TPlMGnj+XpJRdiw/5LZgfPeg150jykPG0
         2DjG1pNXFbO3z/ik7iQ/Ak+D0G+8WzI4rYDDHRXdeS/0ChoFV3I0HCTJx7ttG3U3dN+g
         AhxCNFbF1luPq4NbxFwTL3hjfEu5kWmoFXjOOWdKUNuGB0n9kmkHmXIn5rnM9PJcjtXJ
         AK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162170; x=1736766970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAGnL/Jk0mHfwFhTVnY/JknA1BlI/NlBEd64HszCM=;
        b=c59uFHtubiUpN/tAa8nnxEg5qska/eq6PREu1ME3RVjbwr/9ve9UuQi/r0HCVw7LN5
         VjYzzI9pPUzW1x0k9bVerzFc3l8SXNIbIO2UuAlaA4pSNCJqXr2TeDJjVQtoL+F0t+DY
         6cAiQS1lzrPhmY7oCDP+T4lbT0hfXLEgOjunfbaQkZzgURzFdb+o/oGwb0Lk+OAQCp5n
         Lj3KAHa3ibqIBU4toJ55iy8nYG+gzv8YH+EajeQgwM/r/VRUcBA0c+GCcu4ECjP6Zm84
         LFM0Tdbp3atg48SJvQymqJ6su8ibe0oeZ7SuxAqQaJ6Ckcs7m4T2n6RRpPw7JImIb3Ha
         dlow==
X-Gm-Message-State: AOJu0Yw1GMtkPIgwgLJVTrdK9pzCV888f01TwntIgBX6wELel3iMo/js
	4yOj+HBhCbXaJcmSYARbhfWw0vGuG3QIe1RvUoPWkSkjkbxdy9jundJWivOhvPC4gvpF0x/dSGn
	Z
X-Gm-Gg: ASbGncuTNod72QDZBQqn49UwuK3UqKf/NMUHTCK7znkl5AKH49U3p8+HhSCOqBqrKNl
	wn0ChoMdUc0B6xNZqqJ0xXfiaE9zSj/oHyxr8fpgvSM8LttOw+10vwsBWiRHLtREJzpOYNnG8Wd
	tuUj0aaLE+0RrRn2bhRToRqK3lze3OjTVviUtEz7mXOUjwoj7gMBGCIxwOnyZMyz5XhtF5DjGpF
	MxoDtbzwdbZrWq7PF2RvDFWORbLmoMQ9cQ0e8YRXBLw7RKvtA44LAMh/yOhug==
X-Google-Smtp-Source: AGHT+IHHfvB81IlWX1NWKncUq++jCaYtse2JU5NWB0rqvt7+nipEXsqSHdSLvxqbor2rcxEdi4vKZA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:1519 with SMTP id ffacd0b85a97d-38a5eed02d2mr13627477f8f.23.1736162169976;
        Mon, 06 Jan 2025 03:16:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm598362825e9.24.2025.01.06.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:16:09 -0800 (PST)
Date: Mon, 6 Jan 2025 14:16:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ronak Jain <ronak.jain@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn:
 missing error code? 'ret'
Message-ID: <5e13987d-3bdd-45e9-b16a-b2ece68c4571@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 92fb71333d5737d0296fb968a653dfda4b225175 firmware: xilinx: add support for new SMC call format
date:   3 months ago
config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250103/202501031613.wYttNcqY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501031613.wYttNcqY-lkp@intel.com/

smatch warnings:
drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn: missing error code? 'ret'

vim +/ret +677 drivers/firmware/xilinx/zynqmp.c

6366c1bac3149c Rajan Vaja 2020-04-24  653  int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
59ecdd778879f1 Rajan Vaja 2018-09-12  654  {
92fb71333d5737 Ronak Jain 2024-09-19  655  	int ret, i = 0;
92fb71333d5737 Ronak Jain 2024-09-19  656  	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
92fb71333d5737 Ronak Jain 2024-09-19  657  
92fb71333d5737 Ronak Jain 2024-09-19  658  	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
92fb71333d5737 Ronak Jain 2024-09-19  659  		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
92fb71333d5737 Ronak Jain 2024-09-19  660  					     qdata.qid, qdata.arg1,
92fb71333d5737 Ronak Jain 2024-09-19  661  					     qdata.arg2, qdata.arg3);
92fb71333d5737 Ronak Jain 2024-09-19  662  		/* To support backward compatibility */
92fb71333d5737 Ronak Jain 2024-09-19  663  		if (!ret && !ret_payload[0]) {
92fb71333d5737 Ronak Jain 2024-09-19  664  			/*
92fb71333d5737 Ronak Jain 2024-09-19  665  			 * TF-A passes return status on 0th index but
92fb71333d5737 Ronak Jain 2024-09-19  666  			 * api to get clock name reads data from 0th
92fb71333d5737 Ronak Jain 2024-09-19  667  			 * index so pass data at 0th index instead of
92fb71333d5737 Ronak Jain 2024-09-19  668  			 * return status
92fb71333d5737 Ronak Jain 2024-09-19  669  			 */
92fb71333d5737 Ronak Jain 2024-09-19  670  			if (qdata.qid == PM_QID_CLOCK_GET_NAME ||
92fb71333d5737 Ronak Jain 2024-09-19  671  			    qdata.qid == PM_QID_PINCTRL_GET_FUNCTION_NAME)
92fb71333d5737 Ronak Jain 2024-09-19  672  				i = 1;
92fb71333d5737 Ronak Jain 2024-09-19  673  
92fb71333d5737 Ronak Jain 2024-09-19  674  			for (; i < PAYLOAD_ARG_CNT; i++, out++)
92fb71333d5737 Ronak Jain 2024-09-19  675  				*out = ret_payload[i];
92fb71333d5737 Ronak Jain 2024-09-19  676  
92fb71333d5737 Ronak Jain 2024-09-19 @677  			return ret;

Please just return 0 here.

92fb71333d5737 Ronak Jain 2024-09-19  678  		}
92fb71333d5737 Ronak Jain 2024-09-19  679  	}
f9627312e20721 Rajan Vaja 2018-09-12  680  
92fb71333d5737 Ronak Jain 2024-09-19  681  	ret = zynqmp_pm_invoke_fn(PM_QUERY_DATA, out, 4, qdata.qid,
92fb71333d5737 Ronak Jain 2024-09-19  682  				  qdata.arg1, qdata.arg2, qdata.arg3);
f9627312e20721 Rajan Vaja 2018-09-12  683  
f9627312e20721 Rajan Vaja 2018-09-12  684  	/*
f9627312e20721 Rajan Vaja 2018-09-12  685  	 * For clock name query, all bytes in SMC response are clock name
f9627312e20721 Rajan Vaja 2018-09-12  686  	 * characters and return code is always success. For invalid clocks,
f9627312e20721 Rajan Vaja 2018-09-12  687  	 * clock name bytes would be zeros.
f9627312e20721 Rajan Vaja 2018-09-12  688  	 */
f9627312e20721 Rajan Vaja 2018-09-12  689  	return qdata.qid == PM_QID_CLOCK_GET_NAME ? 0 : ret;
f9627312e20721 Rajan Vaja 2018-09-12  690  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

