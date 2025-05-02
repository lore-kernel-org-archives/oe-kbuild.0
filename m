Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A81A5BA4
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170259; cv=none; b=L1Cy0Zf/AlXCQrnjC/ZL8TvG0Cg59y4ntt119yv0TrSAZQE9zF5sTrl5Rd4ufFLs+GWiMq/dbaKf15i/+Sp7DhMwBsNkm/hzGXklFdgJMi9IZsRR37JjZjH5QE/Mb63BCRyTYmL0LeuNanEpo8OuQd7aNgD7SQII0nEKcBrQaU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170259; c=relaxed/simple;
	bh=5IuYNRTVqn6A3XwJMusb2ZkxCjZMpg1KEva9m2Wb8H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZjpnzjOVQQF6djigzHxChSsbi8e+b/oilPnB4VYMSEQNDhZBxm1kkIL5IAP7fTDuH8gbs9xz/qrR3lltRgU2ccIMxBG9F01M6Vm3nchJDaGDJWmHxdxCzJsNt25NeeW7WHo5V045IaYNA6fxr/MM+Y1tuUo2nOuwkI51OTho+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9QdWmYP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9QdWmYP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efc4577so739360f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 02 May 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746170256; x=1746775056; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvS4s5a0I05qazclYrgeWfQPlW0PvOT3R1kVjI+PNVQ=;
        b=i9QdWmYPbCrSohSehjftzees2qNxyFC9vxQtScE3MhgUORhcbrgA2Xyx+175Qmqtxx
         7w/vxV+bET04ojMcbMXjN32eu2pwel2O3tukO6r69ci4dy3knDnt4UpVt3kQICJknSl2
         4GonOKZ/R2A3/IgXHMGTXwXttpqapx/rKbiVcHHXhvMeNdbBF5WH1W3T4Q0ONA3t/6kx
         TikCGQB4MAkUjyMiDIK+EeO0gwSHQDtSC1F1YxAk1KWWOSju7VHbhGSBSRS82lbRe92o
         I5xz4wRlT29/yZ5NRdHUiHiPERMYHpyj13mRtLFwlA76B76ARuhb0VTwji46T0LfIH+8
         Lizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170256; x=1746775056;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvS4s5a0I05qazclYrgeWfQPlW0PvOT3R1kVjI+PNVQ=;
        b=M/YHsLh/512rTa9JO7n6gJRK+XgOq8Iw3BMvRz65HLrqHZfdLp+K+Y15jTqIhJPuST
         QPnoi2u0O2HAh65+PnBPrfxEjeCOT8UAc63RtbZdLgENunetXd5hgq9ww2VtuFxXuXQT
         Uh8MvNHeQzR1mKo7LLjYOmi/2BkicbCSgB9FmEyZd+LsTLS1Cuh+qRI+ZgZBRrBqg8oW
         aWjyBS+ns3Af/JewpzBLDWXa//60vTbhNsnHM4+OZwNPzDZPYEh36Vw+PzEy/KHZDlcl
         yYLCEH6I+Q8+Zu8PcJ7XqDJ4uWCmGVoAnfppspQr3MCxX5wuYPgz+89hUImwNaufnz34
         a2wQ==
X-Gm-Message-State: AOJu0Yw4V1yXgQU80NyjVKhcvjyGESmayznP8qSm/n7s/l1nDGuTQaqr
	vbGUPld8uy6+jpxcP6YTSfFxY2rHtxF4vY+B5iXXrwBtdr9IKm7VLxNSqHW/inB8qwoK0QOfWt4
	W
X-Gm-Gg: ASbGncuNBZfz0+lgAqRak7jPwESDVdNL0/uXuSEcdlonQpGyeAUncTt/aEu4MZsOXxW
	+FCutrt1vTerKc0Za7SKr5lYjogGyoEtka8BtUtiqjTKuj6KwKI/RLYcL1gTR+dAM9seTZMn/ne
	a7gvACI8GAUcgLh9FHovt2+T81EgDKLLCRGPW2S+wonMy+7+GcKGpwBzmRYhn0eOjDKsi0SV0Qu
	jO+7beLincIpVB6+SmB3OaqOK/46wL2OoinOUtsXDo4Lu0ibwywEaax+BphBFvhRdkNthKRoP9k
	jKFpv7R03Lg6tFUuHhVxtPo6Ktiskx5sR3PiWd17g7lOVQ==
X-Google-Smtp-Source: AGHT+IGKhpHK4Qj1aa1wgANwFRhY2jMZ8RstY4JdT6Gdp+U8JrH8vl8w4zZ9jTtsw8OGZ1cus3oFiA==
X-Received: by 2002:a05:6000:2ce:b0:39c:1ef6:4364 with SMTP id ffacd0b85a97d-3a099ad5c8cmr1199165f8f.14.1746170255572;
        Fri, 02 May 2025 00:17:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0c3dsm1357078f8f.12.2025.05.02.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:17:35 -0700 (PDT)
Date: Fri, 2 May 2025 10:17:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] fs/smb/server/oplock.c:1510
 parse_lease_state() warn: possible memory leak of 'lreq'
Message-ID: <202505020623.KJ87fuu2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250502071732.0CEfmoL8adozPyx4xM1jKHJHDW3YdB-A2GW2pg52uzs@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   272d4285dd17049eceb342b5b4f2b4fd346466b5
commit: 60b7207893a8a06c78441934931a08fdad63f18e [3/3] ksmbd: add bounds check for create lease context
config: x86_64-randconfig-161-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020623.KJ87fuu2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505020623.KJ87fuu2-lkp@intel.com/

New smatch warnings:
fs/smb/server/oplock.c:1510 parse_lease_state() warn: possible memory leak of 'lreq'

vim +/lreq +1510 fs/smb/server/oplock.c

8df4bcdb0a4232 fs/smb/server/oplock.c Namjae Jeon    2024-03-12  1491  struct lease_ctx_info *parse_lease_state(void *open_req)
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1492  {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1493  	struct create_context *cc;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1494  	struct smb2_create_req *req = (struct smb2_create_req *)open_req;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1495  	struct lease_ctx_info *lreq;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1496  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1497  	cc = smb2_find_context_vals(req, SMB2_CREATE_REQUEST_LEASE, 4);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1498  	if (IS_ERR_OR_NULL(cc))
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1499  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1500  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1501  	lreq = kzalloc(sizeof(struct lease_ctx_info), GFP_KERNEL);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1502  	if (!lreq)
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1503  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1504  
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1505  	if (sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)) {
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1506  		struct create_lease_v2 *lc = (struct create_lease_v2 *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1507  
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1508  		if (le16_to_cpu(cc->DataOffset) + le32_to_cpu(cc->DataLength) <
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1509  		    sizeof(struct create_lease_v2) - 4)
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15 @1510  			return NULL;

kfree(lreq);

60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1511  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1512  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1513  		lreq->req_state = lc->lcontext.LeaseState;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1514  		lreq->flags = lc->lcontext.LeaseFlags;
bc025d49c507b7 fs/smb/server/oplock.c Namjae Jeon    2023-12-31  1515  		lreq->epoch = lc->lcontext.Epoch;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1516  		lreq->duration = lc->lcontext.LeaseDuration;
100117279c1da0 fs/smb/server/oplock.c Namjae Jeon    2024-05-01  1517  		if (lreq->flags == SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE)
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1518  			memcpy(lreq->parent_lease_key, lc->lcontext.ParentLeaseKey,
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1519  			       SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1520  		lreq->version = 2;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1521  	} else {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1522  		struct create_lease *lc = (struct create_lease *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1523  
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1524  		if (le16_to_cpu(cc->DataOffset) + le32_to_cpu(cc->DataLength) <
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1525  		    sizeof(struct create_lease))
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1526  			return NULL;

Same.

60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1527  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1528  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1529  		lreq->req_state = lc->lcontext.LeaseState;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1530  		lreq->flags = lc->lcontext.LeaseFlags;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1531  		lreq->duration = lc->lcontext.LeaseDuration;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1532  		lreq->version = 1;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1533  	}
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1534  	return lreq;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1535  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

