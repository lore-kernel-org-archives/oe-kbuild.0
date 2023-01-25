Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B3139F;
	Wed, 25 Jan 2023 08:45:17 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.88.152])
	by gnuweeb.org (Postfix) with ESMTPSA id BCCEA81845;
	Wed, 25 Jan 2023 08:45:07 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1674636310;
	bh=OciI4mUPsQGgzT7kaDOttkQpjgPIeEWTdFoso0WZ4og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ox4Fk1Ix1oE/th4UqATxeAfT9d9vjz+rYCeeledQXyIXJxN1iNsLiuu+dunw0q2D0
	 J4n0z/+j85WSMgv1Nr4uRKf5tiq6mL/Pf8VHuj2U6z4G4HMnGwW9IBhNFhpCh64CeO
	 BdA+Kbtv50sH06inVvfhGUZfFgRj3BBlw+jz3eLAouXvu0VZCAbgAa10ozCAzybHVH
	 jX22iSoPd19XidanThY9M5occItuH95U4C+uaVjmjdeZ5XPiAi1Q6kSa9ps4sCpX53
	 cpPHPJbbV+G9pVThAQQaj+jfk+AaFck1BqKVFq75pMeqGGA7lGgI4TsIwHkWQ4bcrC
	 piQjTCmMZzaHQ==
Date: Wed, 25 Jan 2023 15:45:03 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <Y9DsDxJ+8/IpfdqE@biznet-home.integral.gnuweeb.org>
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

Yeah, that pattern doesn't look like intentional. I agree with you.

-- 
Ammar Faizi

