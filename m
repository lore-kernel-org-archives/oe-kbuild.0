Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAC13CFB6
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Feb 2025 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738393016; cv=none; b=bedG02K9D6F6/z7GsLS0CfkWDieNck8J1v3WbvWHuMCqNoL2oalEcgA+WXyoXeWZbvgWaSwOi4NXKLoFqSF3BJaMoISz1Wxcl/NbaSQLb57AI+GdPbtRRflEkqkui+/gkF+gVIVanH9Je44RbPf0OCkLMmNkP2fJcBKXe38t9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738393016; c=relaxed/simple;
	bh=eYlKP2B2cpDt8OnJBkKZxKSWwya6JrV5Qz46c5KwCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7e7dlYS3xgomSp5tsnbVKRzxJ8MV44QKmI/EbwbGioZIoRUhc4wTWUFoBMdRDpAqUTLbJodXfLJL66+JOvjlpYSUClDN5mNaNbyB5h/o7AVhilC3djrxG0U0+T2fbw9MvMxHh9AaE5nnyjpsjlzApItX/OYiotGnNbkMYjdvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmvJA/cX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmvJA/cX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436a03197b2so18428945e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 22:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738393011; x=1738997811; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=gmvJA/cXedgtJVkKuiYpkB8oWscTCZFUfZvrspjw6UmcmqwWu21OWBOERpbod02w1W
         Icd9W3F/KvQXMdrF/2mt1MfQ3aXtoUFoh2CDIWXujovtY+28Q7xTJpEmhCoTf8GI4Ljp
         +JJzRZJ3Q4eynqrKiIpp6THfAvYlfug0pGOfVgWMmUkvQQvTY5fhLX7AO1RTNB7WxoBL
         0el6UGiQqB1u45VC/VIfyX0D2SssFXwpB/kDH5XAO6zNG3x+3ZxyiVUDdYVDJEqAa4UU
         Ykqzo60GrxIHXthud/Ph2JTOJoYhdTzvfTmsad0XDBaeBekDmlc+9tJlkGBP9jFOyAcl
         X+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738393011; x=1738997811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=lBedDHs/fTnWG2wIE34bHWqxQ910DbOvFUxHMYODZTd4aVKpLLUX4J4iTasF/vkboA
         788Gh80eIhGTwZE/cF8wjSc5UcNRE35CGnLqg0tPVvNHwVqtF6R82/UPjbb+GmEvloiL
         LfqoKIG6cyb89LvIWg8d8vzMX0lRo5Oep3CSUH5AKwe44MyBb9/hOYqfqi/DSPY5+aKJ
         iM918JidybK9Qdh18v8kVqs+4DntpEr/29yzlr/dqV7GS2qmgJ0G+mujIe6RqM6MDMBk
         slizGDALXGhJX4G6JYsiecTnDAEBovF0ToL8KCnP22d9bKhMl69f2rCLqTHFEKoFMCUr
         CFzg==
X-Gm-Message-State: AOJu0Yx9CuSUr1Mb09FPskRBJdufmG4ImcNaFhvxFEC2SPe5IJl+uQQs
	ZkitUAUJ+L59n/ouPTNIEYkTYDvIDsexGoAtWmQDRq0vmHP3fuEh2Yh4LYZ187Q0X2EujkUwrzy
	r
X-Gm-Gg: ASbGncs10z/F1F16z1wc2+fGbc2E3AJ1YBJhkPh8YeGxyw2a6Uo21dr1BpjIAFQ4d7I
	73X5r0vsjm/A44IH5CE7sO3N1IFPPBIHqcPL2shC54rViMX+TQ3fAu+sKHOAZiyf38MGYo+7KN4
	9mmzJuhbGBcRRZsC/YGvp/vmcFQiUk8s/Zq98XKgwCeVGnPnS0yNa5nFaDPXMy4AcNJJKRI6aAD
	L6IUmG8lhTa66ezUxIKrXmV112xHsXRQIfNSY6kGAKPWjhlJy2jQM+tDQxbNfmXye3GH1NgTs3s
	XCyL0vJHqWzgGSCSckyh
X-Google-Smtp-Source: AGHT+IF4UcKQ0jIwxmuQ4/Bm/A6nJ7yv9vR7zNW2m+h0N9tyweL4cWUizHBNcIJ3IIMxju7yF+o5oQ==
X-Received: by 2002:a05:600c:c87:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-438ea3c1cdfmr37427035e9.25.1738393011014;
        Fri, 31 Jan 2025 22:56:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b579dsm6531313f8f.78.2025.01.31.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 22:56:50 -0800 (PST)
Date: Sat, 1 Feb 2025 09:56:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:73
 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line
 71)
Message-ID: <a0c23bdf-520b-4ebd-bc4d-b93cd587ce2d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd8c09ad0d87783b9b6a27900d66293be45b7bad
commit: 69d54ce7491d046eaae05de7fb2493319a481991 wifi: mt76: mt7996: switch to single multi-radio wiphy
config: alpha-randconfig-r071-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010604.nBhFqzvE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502010604.nBhFqzvE-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:357 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 355)

vim +/phy +73 drivers/net/wireless/mediatek/mt76/mt7996/main.c

69d54ce7491d046 Felix Fietkau 2025-01-02  69  static void mt7996_stop_phy(struct mt7996_phy *phy)
98686cd21624c75 Shayne Chen   2022-11-22  70  {
69d54ce7491d046 Felix Fietkau 2025-01-02 @71  	struct mt7996_dev *dev = phy->dev;
                                                                         ^^^^^^^^
Dereference

69d54ce7491d046 Felix Fietkau 2025-01-02  72  
69d54ce7491d046 Felix Fietkau 2025-01-02 @73  	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
                                                     ^^^
Checked too late

69d54ce7491d046 Felix Fietkau 2025-01-02  74  		return;
98686cd21624c75 Shayne Chen   2022-11-22  75  
98686cd21624c75 Shayne Chen   2022-11-22  76  	cancel_delayed_work_sync(&phy->mt76->mac_work);
98686cd21624c75 Shayne Chen   2022-11-22  77  
98686cd21624c75 Shayne Chen   2022-11-22  78  	mutex_lock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  79  
d73dab22e7a8a8f Shayne Chen   2023-06-05  80  	mt7996_mcu_set_radio_en(phy, false);
d73dab22e7a8a8f Shayne Chen   2023-06-05  81  
98686cd21624c75 Shayne Chen   2022-11-22  82  	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
98686cd21624c75 Shayne Chen   2022-11-22  83  
98686cd21624c75 Shayne Chen   2022-11-22  84  	mutex_unlock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  85  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

