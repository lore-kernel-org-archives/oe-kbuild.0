Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5510ED;
	Wed, 25 Jan 2023 08:32:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso690052wms.3;
        Wed, 25 Jan 2023 00:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydFk+1QQs+UYrLN4P50LNVkLFEXgelZRlrFMe2Z9mtY=;
        b=pgU+Evh50K1nQq9oFWChxhsEa9IF2GP1PO50XDbecp7ZDcf7N5oGJ+0rzmyyj5R7yG
         OL2AGJInxzYw6Oym0NNXFwEJtMr/P5/snWxvTdN2weEQ/jwRJgi8o4YYcr4TMkvHhuEf
         eAQa3T60o3KdfStH8xIh6uDYXGyCfu2Rkd7BAf6yqDdygCNu1m6ktwZUNXj9xliAPfGI
         wFwbE+W5NokH/58vDLeL2KKpzmCWs0gaAsNXU2QVdXcr6Xa8JsuVo3BC+8IPM0AACHIw
         aHLrepB+zu+hZ4HdZYrFUm8q2W5/swC/BdjbQvm9q0O7iJ4lAdh+AxYOAZdo9zDe+WEJ
         yzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydFk+1QQs+UYrLN4P50LNVkLFEXgelZRlrFMe2Z9mtY=;
        b=UGtcg2ELqBTeRH//cZmnnMK753KgKEisOxm8ZpnIThtfTXjKu08zht69RZxFqKdCCV
         jEaMJ0aeFQ/SmU7G8BS51ahdg+6yCldifgTu3dGeiWujoGWFo3CBJ+OLCcXs7jwo0HTn
         n6/os/GYdyvVABhi/Okfc3r+77dkDDct/niRfILUsBeNvyaQwlIc9D9dZqnJX7LnNPUh
         eazfcjJqVJmIUG8GrG6opZ5G78NUpizxCMbSomDJpDGQpvpGRgUtFyEywA4Yt9jZz9g5
         2WAhVb+tw0I9ArYi2SwRUNqOb5vSxwh22wCyMcou61fVOEiGwbCLtSDDu0j6Yz7h7IcJ
         lsdw==
X-Gm-Message-State: AFqh2krY3/cR0cbX6/9CbMn00glnf800uyDXGMxSBDMpoMhakIE0iRCA
	bymTmiXq39Yq9xCW4hklVgAtI39rMgHJXA==
X-Google-Smtp-Source: AMrXdXuRm6/ngedujLTCCH23z0f7R/SvjC6KC3rlCe9I2JeiatMJ3mmnKP6u8Ms1vC/xU10vpoNyTQ==
X-Received: by 2002:a05:600c:3088:b0:3da:1bb0:4d8a with SMTP id g8-20020a05600c308800b003da1bb04d8amr31111727wmn.16.1674635546710;
        Wed, 25 Jan 2023 00:32:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm1389962wml.9.2023.01.25.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:32:26 -0800 (PST)
Date: Wed, 25 Jan 2023 11:32:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <Y9DpFTItKK8NkFR0@kadam>
References: <202301241716.MgPWF6fU-lkp@intel.com>
 <Y8+tTlFbtbVMhUNI@kadam>
 <Y9DkEpSWDthHDRGn@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9DkEpSWDthHDRGn@kadam>

On Wed, Jan 25, 2023 at 11:10:58AM +0300, Dan Carpenter wrote:
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:1265 rtl8188fu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8723b.c:1168 rtl8723bu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:3298 rtl8xxxu_gen1_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c:1989 rtl88e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c:1429 rtl92c_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:2294 rtl92d_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtlwifi/rtl8723ae/phy.c:1393 rtl8723e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c:2321 rtl8723be_phy_iq_calibrate() warn: re-using outside iterator: 'i'

These are all "false positives" (kind of).  It's 8 copies of code which
does:

	for (i = 0; i < 3; i++) {
		...
		if (i == 2) {
			for (i = 0; i < 8; i++)
				foo = bar[i];
		}
	}

So the loop exits with i == 8 instead of i == 3 but that doesn't matter.
Ugh...  Did the original author do this deliberately or did it just work
by chance?  I really prefer buggy code to code to ugly code.  With buggy
code it's a technical matter and easy to fix, but with ugly code that's
like a big debate and a social problem...

On the other hand, in this case, I don't think anyone is going to defend
the original style from these drivers so I may as well patch it.

regards,
dan carpenter
