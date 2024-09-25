Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB1126C14
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252174; cv=none; b=sLGfLe8SAd5WMBOkBUHWbcszFYjZsdqLurtVnN/7/Cg+1kFzVFDP53BKNEAkaoZB7Q6UUpXRtj0FsR/Bb9piG1M48tz3tXM0kFrd24fWTi/PfqdupuCk5eUwXIgwNN4TE2LglZAOWrVrW/hCAIukVjr6olybTXmSV2ZZv50VLiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252174; c=relaxed/simple;
	bh=TP/EqGwIcdaNTpB7B0trS8uuFsRJm3WDHYlbwM51nB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBPYiNI9oEvqqzydE/4ge7jHh/lMQ+n9CCBDSbdUxb7TAsH2VRAERYss0XSXaOu2m9LGwJtAIgafxCAjYgmEnww2rgsu0bCHxWcXudjBZgUWCxuf4ohZ41dZvKrVzUMbN/Yp4fPjr5kDsCgJsf/Hti091Ym/QlTnVcyopEiYnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KDTYToxr; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDTYToxr"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f762de00fbso65108111fa.2
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252169; x=1727856969; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqCLxwK7Ruej9Usgo8H6IhFyOHoSSLXS9pySoZDCqBk=;
        b=KDTYToxr1CTsCTkf8mEdacUjeOY3hPtL4o8tJa/fJ00CWFwmTGx8ZtKX7thZvLN6/V
         nC+VKrHSCS9Gu4OGwo2tvKuuN3JiZ6rNYeQ2+2AAb009WJDdSEgAUahvrm1J0YePZWv+
         mDxpcF8/ssSwyscoBMb/rzQwr3rW3OwyAbqejcbZ/mHf7/bbuOZAjjIGx1GhvwEDBH3a
         2b4juxQ3Ol6W1Sh+nXP7L24JaXJM/mCeapTROyTstd7Q06l8UbzghpT3gEgk9sccdTdK
         HKskpJqPRKig7Oa0yh8Scb/9vPJTYOQ9wEORljxO6s8xmjq2P90rnledPJuEd71DHvQw
         69LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252169; x=1727856969;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqCLxwK7Ruej9Usgo8H6IhFyOHoSSLXS9pySoZDCqBk=;
        b=PCi1gAuju0X1L0c1BZVB19+XA6/0W1/cZMlSkz6bFfCwyzgJwG/BgLp83/NqLfSq9C
         3m35b3V90+ejscTnOaXR3eT3OQHKBFYAPydL1Jsatkdvh6MlblwPpfsgyDYKQKpgy1o7
         4q9UdeiMdqZ53CX7qdlNH2ZCCcRBv4q1pD9zjqV22XUzu4QXtHghYiY/1qxg5i2QmVN1
         soysICgFkucmvagKllUIy+wJGRfsIqn+eyZ/OBwGAxR1sO3yNDJn76FVoFBM3GvZBrpZ
         aMBzPN5WW40cBYeJAkj27QRQg+L3mcX7YW6S5FPoZZsAogzRF0GzqehOm0IuSuaS+2OW
         1CBQ==
X-Gm-Message-State: AOJu0YyNicwVJ3wnnyHw5FEpWbfkLDEKGcsr8ekCq1dS/g/fWfvlca+9
	k7Z8Mheb14CU0Ma7KzKPH0tPOq+8gYSLjA2I7yTwXKTE2/iDO23DpBVWca9Ly5+CDEJydiqZSIy
	1
X-Google-Smtp-Source: AGHT+IGq0vceB7R4KkRyAg9EqttOVpXucos/ib8+wFzaPgBxOUGaK8G6TAjzVrbW4iwHcV7Geu90nA==
X-Received: by 2002:a2e:be11:0:b0:2f5:a29:5a42 with SMTP id 38308e7fff4ca-2f915fdbf84mr12776651fa.14.1727252169380;
        Wed, 25 Sep 2024 01:16:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2f96d7sm3318696f8f.78.2024.09.25.01.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:16:08 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:16:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	sanglipeng <sanglipeng1@jd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26341/30000] net/bluetooth/smp.c:1634
 smp_user_confirm_reply() warn: variable dereferenced before check 'conn'
 (see line 1632)
Message-ID: <17ed0563-43c9-4cc6-95aa-7a6f6f08fead@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: bd705301e9438cf06d431bc1594ecfbbe6b21841 [26341/30000] Bluetooth: SMP: Convert BT_ERR/BT_DBG to bt_dev_err/bt_dev_dbg
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221743.6Lz7Tnxc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409221743.6Lz7Tnxc-lkp@intel.com/

smatch warnings:
net/bluetooth/smp.c:1634 smp_user_confirm_reply() warn: variable dereferenced before check 'conn' (see line 1632)

vim +/conn +1634 net/bluetooth/smp.c

2b64d153a0cc9d Brian Gix              2011-12-21  1624  int smp_user_confirm_reply(struct hci_conn *hcon, u16 mgmt_op, __le32 passkey)
2b64d153a0cc9d Brian Gix              2011-12-21  1625  {
b10e8017bd9d02 Johan Hedberg          2014-06-27  1626  	struct l2cap_conn *conn = hcon->l2cap_data;
5d88cc73dded31 Johan Hedberg          2014-08-08  1627  	struct l2cap_chan *chan;
2b64d153a0cc9d Brian Gix              2011-12-21  1628  	struct smp_chan *smp;
2b64d153a0cc9d Brian Gix              2011-12-21  1629  	u32 value;
fc75cc8684d21d Johan Hedberg          2014-09-05  1630  	int err;
2b64d153a0cc9d Brian Gix              2011-12-21  1631  
bd705301e9438c Luiz Augusto von Dentz 2021-03-15 @1632  	bt_dev_dbg(conn->hcon->hdev, "");
                                                                           ^^^^^^
Dereferenced

2b64d153a0cc9d Brian Gix              2011-12-21  1633  
fc75cc8684d21d Johan Hedberg          2014-09-05 @1634  	if (!conn)
                                                                    ^^^^^
Checked too late

2b64d153a0cc9d Brian Gix              2011-12-21  1635  		return -ENOTCONN;
2b64d153a0cc9d Brian Gix              2011-12-21  1636  
5d88cc73dded31 Johan Hedberg          2014-08-08  1637  	chan = conn->smp;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

