Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF13570D1;
	Tue,  3 Feb 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148515; cv=none; b=OIx1NDLVzIDa5ZnxQG4GymAlfHH1tvVp4nl2kXtgKT3oo+1llAb68zxwd4f6W1WDIq+WRwYMA7XFBnPas73uTUxeuxK5pCxeNo03ODLvJAMtnKgfLl1QrR5ABhMo8XfshOdyxQkKXWB9qT/8OOMXFQttKks/nZ5ViDgn+51Z6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148515; c=relaxed/simple;
	bh=/d0yCgn1vDVFFGtEUOsPkOVI9mkDvwpvBAxjDrmdMSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VO+f/RuORG+neyYnEX9W54bxHB/YDDa5B/VwQ1A5nfke28r2MT4gpKYvz0BX/3cx5V/gFUWgcKVQ+KudlsKpKmZfsfilWL5c9B9rRzfNMxuQISiQMeWYaI1+M9TEriGInljpFkza2pjTCcAyvqvLPwXZjYSI3Kboreo92uMYzSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JM/EOOzi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JM/EOOzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95104C116D0;
	Tue,  3 Feb 2026 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770148515;
	bh=/d0yCgn1vDVFFGtEUOsPkOVI9mkDvwpvBAxjDrmdMSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JM/EOOzijxLnw8xRdSg6EfRxXhu0NELeKH/e1fn85Sp+VPBR2fNmM8amNJlJnEWzN
	 nvnOc3fOAPiTWISO9lgzGsfiiTveM0KtVlpcFuQ75gol4+sprSHNnyGF/1jOyJRsgW
	 S9o/3mDZQtpaDNoOzFQQRQ4uZ4Iz+WLTQYrQiOUTf6YmdYGHG0T7L2GboE8yKi7y81
	 2Y2HR4LqRpNQqptBWpXxY64T4wKLi4xmM1ltMxoVMWvvJ6j8b6fr0tolzyk9lzLhgc
	 gsmA8qCijrhrmtOLfxuFtweJVoqbStMfDxcyhmwzPFtpD+/pBO4AvGb6NWOmDZ/Ue8
	 dp6zZfAgEA6QA==
Date: Tue, 3 Feb 2026 11:55:13 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, oe-kbuild@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: kernel/unwind/deferred.c:257:18-21: WARNING: Unsigned expression
 compared with zero: bit < 0 (fwd)
Message-ID: <hwdecvhaoykfuv566zrby4yigs6wshy5poey2zojzkderpcsar@rl7fwu3di6ma>
References: <beb6a395-d920-6c9a-7915-ea5c5f92954@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <beb6a395-d920-6c9a-7915-ea5c5f92954@inria.fr>

On Mon, Feb 02, 2026 at 12:50:48PM +0100, Julia Lawall wrote:
> bit is unsigned, so it should not be less than 0.

Hm, I distinctly recall reporting that issue some months ago, along with
another bug.  I guess they got forgotten.  Let me work up a couple of
patches.  Thanks!

-- 
Josh
