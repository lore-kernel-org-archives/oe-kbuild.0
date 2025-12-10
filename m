Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9D2BEC4A
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350270; cv=none; b=IK1N6LtcnSI2mNyaa9ydW+78+waaGZqMjRA9wpwAlIGMpmSZTJpI1WZ0vO9Y/2jhSQfGEMOHrowabHLzrMVwrpxPiDFEXovEFLOKhOWCG1FFhTeXvINubmv8XCDofRzlW/5HkKL44TCTobdjKyQaJQgg78K+g3UQDI22WiNnEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350270; c=relaxed/simple;
	bh=hoU6B1IUKqEePrjSbJ1rl3P9dAuWbzaOt76sUeMAdSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPqWPzy/GWn/mHxa8S03+774gh1ghT+UUr0YUaxf+YNEIahZ/IEXxKW/mI7EgYC7O42wxAS98qyyiNVUOnQSegqEBH37YG3y2P4RIN/OiKlrUbeO1CeuumC8JIeuANVXVM5p/J6NUnpP6fwyBAPTSBXMLPVNd6zGqpOtnlQB5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QU/UpeWz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QU/UpeWz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so2614751f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Dec 2025 23:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765350267; x=1765955067; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wneUdiZIUvSz4bIt7t7dzaQ34xX/EF8I1Wc2lGxK/KU=;
        b=QU/UpeWzw0Gh/lKT2RTHQVbkLItlD1nTblTnVbLULC6woJUHZUQkjmgTYxwGdz/vOv
         5tztKA5n5d3ApqmOm1wFtMXZDOOGoXzSwI5uNYTNdM+/sN2AAGdjj9Gg0L1ClBwOMi5W
         3PK8QIWcAYWeguTZx9zCdb26aV4brqvS9rpuzaT9WMrrOqxqnNRuRzwCpIJlXnVbvzDj
         +LnFvKp+hSlzsI21awyM+ZFI7YiCr3eQee8VYQTAuqK2k01o3Nm+gYiZuffDVFdQEcuc
         8AgBmCZLEg38RmMRXNx1q4nsX0ZJFbMgOGoYM5c8a8e0c4ad1oqDrxS7253UrNKfSzUH
         G+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350267; x=1765955067;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wneUdiZIUvSz4bIt7t7dzaQ34xX/EF8I1Wc2lGxK/KU=;
        b=tRC//a9PRcmCd3fNamAixcyPWybxJPk4f9GVphBi/SdSr+DiZMI4wopnoT2vmV6UhQ
         MnDH2WBcz4YJzQXQWk7iEhf4Hba/2Wm/OrpL5ZOIhYCszg1qE3ja+4wpmQ46k9ToErx1
         lWAYAOaL8idhf/yHE6oW/vcCY+PzZhRo2E7UqRNWFPFtTRhS+3paevOtNtnhnfhKR+/B
         rvOToP+eSJTMbHSTgVBSw7D6ZOnmj1bf0olWNRRP65pxczoNiw40jQDAidydHqOye/wF
         dbHZFvOPUEmL3b8tUrbK3UGd15QC7BGl3k1oz0HGdUouIq/ZVIMVGePKW59Om7g/n+I3
         uTjw==
X-Gm-Message-State: AOJu0YySGE18xSsd0kNOWjS3OoKOYgRuYW/1s57K02sOb/Y6eTdbAjlE
	dNxt+4dA2CnETmpAaPTKLJ4gn0IglZ1Zdm5Cp54DqT67jy0HTGf5eyZKGj2jZnB8GEa50vZPCm1
	GFbw1
X-Gm-Gg: AY/fxX5Br3GyuLIzpotltttU+hubQnP54RapH0nTpZdQliRIJPBPLxZs4nMjOw+pItc
	ebk1NGpYgdYM+BczXPjgYIk45lfZc6WF16Mzy+V29m8Yg4agx9XqCvHRqaeSBhBMNsk6m/sfNeI
	K5mqx8+I5kGsH81gWK7IzQDwqAC9X+cCX1J2U2pDoL/cN/YlnZutkasVuzDU79sjvs1IAJHtKGR
	QYdDNk4luUgOJt3H4/AKFNJX/uEfWkerWelsa6Tr6tKqRUI2QYfBpDDbiFTWMNl3SHtJLpC6AJ7
	mxwxN6a74eu/HlqwKL7lFyW1K49dHpR69NTXWnBzetr2b9eXv4mvP3z2RdnfjpCGHsJsQUdE+bF
	Gf7j9chn2Vx1LkUWCDRJBzkSQXKXV6rS+LKHrchmUFXNeMHpz046ErVrUfzuoNXAKkYw94px+U4
	fhcLSLW+bt+ARaQrYB
X-Google-Smtp-Source: AGHT+IFcZ/UTVwf8224aO0fl35Qk8UwQ0QlCQ27fmB7JwmfzLHOOZKb1nT6qHZ293CtrmggIF1MUcg==
X-Received: by 2002:a05:6000:2dc7:b0:42b:3bee:a7ff with SMTP id ffacd0b85a97d-42fa39d2f96mr1265827f8f.24.1765350266483;
        Tue, 09 Dec 2025 23:04:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331df0sm37067886f8f.36.2025.12.09.23.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:04:26 -0800 (PST)
Date: Wed, 10 Dec 2025 10:04:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rohit Mathew <rohit.mathew@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error:
 uninitialized symbol 'overflow'.
Message-ID: <202512100547.N7QPYgfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251210070422.rO4XnRIozRdERnyjIZy9c3-pyQhg0iNk_0eH__Lr7hQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 9e5afb7c32830bcd123976a7729ef4e2dff0cd77 arm_mpam: Use long MBWU counters if supported
config: arm64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251210/202512100547.N7QPYgfb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512100547.N7QPYgfb-lkp@intel.com/

New smatch warnings:
drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error: uninitialized symbol 'overflow'.

vim +/overflow +1112 drivers/resctrl/mpam_devices.c

823e7c3712c584 James Morse  2025-11-19  1070  static void __ris_msmon_read(void *arg)
823e7c3712c584 James Morse  2025-11-19  1071  {
823e7c3712c584 James Morse  2025-11-19  1072  	u64 now;
823e7c3712c584 James Morse  2025-11-19  1073  	bool nrdy = false;
823e7c3712c584 James Morse  2025-11-19  1074  	bool config_mismatch;
b35363793291e3 Ben Horgan   2025-11-19  1075  	bool overflow;
823e7c3712c584 James Morse  2025-11-19  1076  	struct mon_read *m = arg;
823e7c3712c584 James Morse  2025-11-19  1077  	struct mon_cfg *ctx = m->ctx;
823e7c3712c584 James Morse  2025-11-19  1078  	struct mpam_msc_ris *ris = m->ris;
41e8a14950e173 James Morse  2025-11-19  1079  	struct msmon_mbwu_state *mbwu_state;
823e7c3712c584 James Morse  2025-11-19  1080  	struct mpam_props *rprops = &ris->props;
823e7c3712c584 James Morse  2025-11-19  1081  	struct mpam_msc *msc = m->ris->vmsc->msc;
823e7c3712c584 James Morse  2025-11-19  1082  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
823e7c3712c584 James Morse  2025-11-19  1083  
823e7c3712c584 James Morse  2025-11-19  1084  	if (!mpam_mon_sel_lock(msc)) {
823e7c3712c584 James Morse  2025-11-19  1085  		m->err = -EIO;
823e7c3712c584 James Morse  2025-11-19  1086  		return;
823e7c3712c584 James Morse  2025-11-19  1087  	}
823e7c3712c584 James Morse  2025-11-19  1088  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
823e7c3712c584 James Morse  2025-11-19  1089  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
823e7c3712c584 James Morse  2025-11-19  1090  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
823e7c3712c584 James Morse  2025-11-19  1091  
823e7c3712c584 James Morse  2025-11-19  1092  	/*
823e7c3712c584 James Morse  2025-11-19  1093  	 * Read the existing configuration to avoid re-writing the same values.
823e7c3712c584 James Morse  2025-11-19  1094  	 * This saves waiting for 'nrdy' on subsequent reads.
823e7c3712c584 James Morse  2025-11-19  1095  	 */
823e7c3712c584 James Morse  2025-11-19  1096  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
9e5afb7c32830b Rohit Mathew 2025-11-19  1097  
9e5afb7c32830b Rohit Mathew 2025-11-19  1098  	if (mpam_feat_msmon_mbwu_31counter == m->type)
b35363793291e3 Ben Horgan   2025-11-19  1099  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
9e5afb7c32830b Rohit Mathew 2025-11-19  1100  	else if (mpam_feat_msmon_mbwu_44counter == m->type ||
9e5afb7c32830b Rohit Mathew 2025-11-19  1101  		 mpam_feat_msmon_mbwu_63counter == m->type)
9e5afb7c32830b Rohit Mathew 2025-11-19  1102  		overflow = cur_ctl & MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;

overflow not initialized on else path, but I haven't looked at how
&cur_flt is set in read_msmon_ctl_flt_vals() so this could be a
false positive.

b35363793291e3 Ben Horgan   2025-11-19  1103  
823e7c3712c584 James Morse  2025-11-19  1104  	clean_msmon_ctl_val(&cur_ctl);
823e7c3712c584 James Morse  2025-11-19  1105  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
823e7c3712c584 James Morse  2025-11-19  1106  	config_mismatch = cur_flt != flt_val ||
823e7c3712c584 James Morse  2025-11-19  1107  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
823e7c3712c584 James Morse  2025-11-19  1108  
b35363793291e3 Ben Horgan   2025-11-19  1109  	if (config_mismatch) {
823e7c3712c584 James Morse  2025-11-19  1110  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
b35363793291e3 Ben Horgan   2025-11-19  1111  		overflow = false;
b35363793291e3 Ben Horgan   2025-11-19 @1112  	} else if (overflow) {
                                                           ^^^^^^^^
here.

b35363793291e3 Ben Horgan   2025-11-19  1113  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
9e5afb7c32830b Rohit Mathew 2025-11-19  1114  				      cur_ctl &
9e5afb7c32830b Rohit Mathew 2025-11-19  1115  				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
9e5afb7c32830b Rohit Mathew 2025-11-19  1116  					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
b35363793291e3 Ben Horgan   2025-11-19  1117  	}
823e7c3712c584 James Morse  2025-11-19  1118  
823e7c3712c584 James Morse  2025-11-19  1119  	switch (m->type) {
823e7c3712c584 James Morse  2025-11-19  1120  	case mpam_feat_msmon_csu:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

