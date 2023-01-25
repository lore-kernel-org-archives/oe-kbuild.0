Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690473FE1;
	Wed, 25 Jan 2023 14:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D996C433EF;
	Wed, 25 Jan 2023 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674658616;
	bh=6sSMclZHpHieWRmYj4HaLQzwVSqN9/YPbU2iejiwc+M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SikK3Hea/KQmmaeMwpIRuuSvr6F6O0nAchQYQ6KqlBpoZBO+HiyAnyfW//0dEeAWG
	 hkXUUaSvjLH8xy9DX0oPdC/vEytFyROGUZchQhyWwta4FyRssk82vt5FYSyqxwR4Za
	 XTJBeknhzV7hba26CXSXYd7y2hpeyA1uLu1s1WL/1o3X6Izeo4il65SDBVq1PZ1vys
	 JcCL701W2gVYrIkqXvaUr9wImfbHrl2cMHU30I6arhZPWVBBLS2viW4KR5d0nYeQGd
	 R6bA2mjVnDOAeNVnf/L22ig3d/pcweX4/xJUJyArebwznc4gAuzTUlYfd7lVcujbuR
	 F/LvAkxGeAOrA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A97FF5C02BE; Wed, 25 Jan 2023 06:56:55 -0800 (PST)
Date: Wed, 25 Jan 2023 06:56:55 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <20230125145655.GF2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202301241716.MgPWF6fU-lkp@intel.com>
 <Y8+tTlFbtbVMhUNI@kadam>
 <Y9DkEpSWDthHDRGn@kadam>
 <Y9DpFTItKK8NkFR0@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9DpFTItKK8NkFR0@kadam>

On Wed, Jan 25, 2023 at 11:32:21AM +0300, Dan Carpenter wrote:
> On Wed, Jan 25, 2023 at 11:10:58AM +0300, Dan Carpenter wrote:
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:1265 rtl8188fu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8723b.c:1168 rtl8723bu_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:3298 rtl8xxxu_gen1_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c:1989 rtl88e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c:1429 rtl92c_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:2294 rtl92d_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtlwifi/rtl8723ae/phy.c:1393 rtl8723e_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> > drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c:2321 rtl8723be_phy_iq_calibrate() warn: re-using outside iterator: 'i'
> 
> These are all "false positives" (kind of).  It's 8 copies of code which
> does:
> 
> 	for (i = 0; i < 3; i++) {
> 		...
> 		if (i == 2) {
> 			for (i = 0; i < 8; i++)
> 				foo = bar[i];
> 		}
> 	}
> 
> So the loop exits with i == 8 instead of i == 3 but that doesn't matter.
> Ugh...  Did the original author do this deliberately or did it just work
> by chance?  I really prefer buggy code to code to ugly code.  With buggy
> code it's a technical matter and easy to fix, but with ugly code that's
> like a big debate and a social problem...
> 
> On the other hand, in this case, I don't think anyone is going to defend
> the original style from these drivers so I may as well patch it.

Looks suspicious to me!  ;-)

							Thanx, Paul
