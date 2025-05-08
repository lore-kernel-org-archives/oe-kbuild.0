Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E81DE2D8
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 05:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683253; cv=none; b=Es3BAwk227LHIpM4hjCkSqpzTQJt97DeRkN/UUsc5xyNgeuK2d8hQOqAOUvTtzC6pJ4ncJmfSV/bsUnOxWl8TH1X22KHDh19jatKnoGsxDvdgpfnVCzwaRSdQ7plVaRp3KeySYBKzTEInTDq6zjAVe+z9soURSkDmMXwZbli8pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683253; c=relaxed/simple;
	bh=M4+zHfcI33Z2cFnsOe/pEfEdRumAQbSlZAruITsX9Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUJDKuZLuxDuQWLZdj5+vs6ksknOdyUcIsaqZc9NRBjUcb5fCN3uCdj/14x0H4c6jOFQ4t+JFNCTuRp5wcYi5QthsINdj4ruzv+ZJlwnC/Qgh03xpd6QxIvBd47S8d70cHzcXymq+7EL23Yp0hasD9JP+ABQcoHGvQR4H6rKLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcWoIzzz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcWoIzzz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so3731325e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 07 May 2025 22:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746683249; x=1747288049; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5CTBM0j2lcGjU5ouKbWKErsqM/JgWcN5EvB9r2bUWU=;
        b=NcWoIzzzyPcr6ZPx/FHdoJKyANCjDqXhaRPHHyNXTPSuzMQftOv8nJqf9y/x+Lwcgt
         z186Bdn+qIp5Qmdl+GqAkubNynX94p5yaaStCXKTQUUvXmVsCYGMQWifOenABnoNuNo5
         sCraFHIH+5fyIfKWvr6zryLvbOpY5x1A7nMPtfDWLd26MBP+6a/WNqhwXygXc4sSLFW6
         PI7CJ+911c56sK/8OoWYiq0dWD0TxNz76SCuMGyNruntNEim4ByKVrMB8Q0+ZFrsr0aG
         dxvZ9pdDC/D3SrwW2jqlXMe4WM3TffePQi0adUqhBGBeZ4/I5aBruYalQvl3fEuGohbL
         oyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683249; x=1747288049;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5CTBM0j2lcGjU5ouKbWKErsqM/JgWcN5EvB9r2bUWU=;
        b=eh9zK4O6jzOjqZYhiiIVi+g6PMTH1hkmm0LOMn9ur66QuT/5QYVBBtLSCcL4VT/iNN
         FJ0z6Ea41ZJFfM3W49MIYVUjhUFcfBLPkt2PsawIuy9A7d1mwZI1ZNEsYoGBc2Zb6RBq
         g38tyWcVFeOeNIa+vt2uHXqUlm92/5VAZuehsosXEyTtitPSCyMRhcL2QwEHhl6gLx6m
         f4tpyHxaBPOZ9iVvrPPYsUQjC9X2epSlc+RZUax1raO2wOqo/MuSNlP6HOlpzw8aF1OW
         uoIWjMv7n43x71Ys+WTji38pMkgWv3+j6lZqHWa3FSgaDVFBoe/dLmpVOY9JD4PMHdu+
         zong==
X-Gm-Message-State: AOJu0YxsDhUOZJEnevgeFeuD7UR2uNr4ZIIh/JpbGjGcYYJn0PCkbbu1
	lvZWlMcclOd1beRBYgCm/eZKiq2aB9GBWcHImPU+E7wgHjRfJ3nez76Bv95fg8wf4/fjjM87ZaR
	Q
X-Gm-Gg: ASbGncsMZYVjI2I2nuR+J6ZMQVzOzui5UJU/26VYnV2wLm0lTMMuPOjOFO3kt1A8hnh
	DnVvLETz5oc5AH1d6YdNtyUu2+AokctHkfE08GKWMwXp/bW7+KBIzFLjeDbHzEKxjW4/+GcdzWh
	ITYEPSnTtxrXvAAQfUF45BpPx5CS20q+3V3I816Js9ajLK7M9lok6uZUWordZyxHCuorGMqYQHs
	0CMxKMC2zG3wEYeFTjjOV2BMlpLRIhFLfTGVQFWq/tB9LUsVkCFQlp5aNhbQGuWJbcyoVbYVzmm
	rVwxLTGPMLpVt3tIYtr8rXN0uGrQvSDzmsbqYUuttkqUYQ==
X-Google-Smtp-Source: AGHT+IFcFCh0MsHBkg+J+VSER1ov0BEAS5iQlZeuPgTMA0LYLNvoc9VAJTqMWqYUfF3nzedFbo4nHw==
X-Received: by 2002:a05:600c:35d3:b0:441:d437:ed19 with SMTP id 5b1f17b1804b1-441d44c4457mr42205415e9.11.1746683248755;
        Wed, 07 May 2025 22:47:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f3c2sm24406215e9.15.2025.05.07.22.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:47:28 -0700 (PDT)
Date: Thu, 8 May 2025 08:47:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even
 be NULL?
Message-ID: <202505080231.7OXwq4Te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250508054724.e-H20OfcQcMKXhW_Jq2-HZsaSDvrAfqDJ4ZDz_Ho3ZI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   707df3375124b51048233625a7e1c801e8c8a7fd
commit: 18b4fac5ef17f77fed9417d22210ceafd6525fc7 ksmbd: fix use-after-free in smb_break_all_levII_oplock()
config: i386-randconfig-141-20250416 (https://download.01.org/0day-ci/archive/20250508/202505080231.7OXwq4Te-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505080231.7OXwq4Te-lkp@intel.com/

New smatch warnings:
fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even be NULL?

vim +/opinfo +155 fs/smb/server/oplock.c

e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  145  static struct oplock_info *opinfo_get_list(struct ksmbd_inode *ci)
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  146  {
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  147  	struct oplock_info *opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  148  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  149  	if (list_empty(&ci->m_op_list))
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  150  		return NULL;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  151  
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  152  	down_read(&ci->m_lock);
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  153  	opinfo = list_first_entry(&ci->m_op_list, struct oplock_info,
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  154  					op_entry);

The list_first_entry() macro never returns NULL.  If the list is
empty then it returns an invalid pointer.  Use
list_first_entry_or_null().  We have the check for list_empty()
at the start of the function but it's outside of the lock so it's
probably not safe to assume it's still true.  (I haven't looked
at the locking here outside of what the kbuild-bot includes in this
email).

36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19 @155  	if (opinfo) {
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  156  		if (opinfo->conn == NULL ||
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  157  		    !atomic_inc_not_zero(&opinfo->refcount))
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  158  			opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  159  		else {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  160  			if (ksmbd_conn_releasing(opinfo->conn)) {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  161  				atomic_dec(&opinfo->refcount);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  162  				opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  163  			}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  164  		}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  165  	}
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  166  	up_read(&ci->m_lock);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  167  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  168  	return opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

