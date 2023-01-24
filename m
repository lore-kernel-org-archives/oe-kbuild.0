Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9510E9;
	Tue, 24 Jan 2023 10:05:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m15so10999832wms.4;
        Tue, 24 Jan 2023 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/W5I/vqz3V9Du0W8qMK3o31sfx9Hv291VJjdr/iY8c=;
        b=Ay1/0FjtPY2v0KXDZbSY3HWfuU/jfE4xE6celhemKLNencUMV6a6nWb8Pn/qM3FH8k
         MSgjh7NVgMoy6rqD2UTY7tGJ6EVfkHn/OHivUDC+9K6N+OzzJa6g/j950Q8IF/Z0/lEZ
         Hx23NB9URwIeqrlym2Sz7ez/vaugpUKVaj2Q5trFZil4Z/2pIEBQK9ndPIo/tLiNiUHw
         ocaN4prqMjooyyqZJJZWkPWTtBnubEk9p7osStx9Cy3bLkGlJ4G6VpB5hWrACb/eoC03
         Fvtx5cin1i40kaO0BkVpPw/VDx5vh65GgWNr5YqLya9pXxPrv35rtL+ckEMrt3qyl4Eh
         jSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/W5I/vqz3V9Du0W8qMK3o31sfx9Hv291VJjdr/iY8c=;
        b=f1sdmXJ8AHIICpEaWnQbMi5Nm564eDnMyMOFcoeKP2FJw3B16vA5/yibCY24PXXHHj
         YxTYsRXPzU2VGmLOIJffHDm7DhjztGr2fQrdmPY6N0ROxVPCMFJnFq1ieLZR9wtOA7/+
         VcUJtczId4t223IwDWp/Z332ZgCih3YaDNDbEoq+tteXl4TbvpI/DOwLsKhHvT7zq7YU
         T+o+tCUHQmpOKtkRv307+rZyFO6KEvJGKIKl1MIZ9WuENjYirsOJk88vdHOQAy3gf2Jd
         UT3xSryDB84JHAr/41G0VSiWLMN2sencs7/AzY2M3bgkwABIpZ/AmVLwFvmf0q+zIO8e
         z7pA==
X-Gm-Message-State: AFqh2krwmKw6/E9VC+MKXpjjiFYure1L8Jv/upxZlmjPrayPiFGv90+8
	yr6A6mGUxKTN5v5+uN43J5zVUnbc4Rgb3w==
X-Google-Smtp-Source: AMrXdXvawR1Z9dpyZQr5mf9tXVGIKpU34bT6QfGgxtdGRPohERF+RuxsiAEMLdo7RZyvYiNBLOsNGg==
X-Received: by 2002:a05:600c:6014:b0:3da:2032:6c0f with SMTP id az20-20020a05600c601400b003da20326c0fmr35017550wmb.31.1674554713096;
        Tue, 24 Jan 2023 02:05:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b19-20020a05600c4a9300b003dc0d5b4f75sm1476875wmp.43.2023.01.24.02.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:05:11 -0800 (PST)
Date: Tue, 24 Jan 2023 13:05:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <Y8+tTlFbtbVMhUNI@kadam>
References: <202301241716.MgPWF6fU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301241716.MgPWF6fU-lkp@intel.com>

On Tue, Jan 24, 2023 at 12:32:14PM +0300, Dan Carpenter wrote:
> Should probably
> create a static checker warning for nested loops where the inside loop
> resets the outside iterator to zero.

Done!  I'll test that out tonight.

kernel/rcu/rcutorture.c:3582 rcu_torture_init_srcu_lockdep() warn: re-using outside iterator: 'i'

regards,
dan carpenter

