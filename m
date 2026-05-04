Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38783EE1D2
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 19:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921553; cv=none; b=s1t0Azq6x/dg1m+kTGudv7zY5h2YjbVW+1dVDI5K9QGxwXyxj0Rv2lQx37yXh+kZPdB2m6rYM2StmUDimqqBcYJFMLCxZDun21tHOg1nVNRBkj2sy4c+QKO+GNJjbucNtvdOl/rmC5JtG557dTi0H9mJpgp4BMMQGfk2k/cFVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921553; c=relaxed/simple;
	bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fecwRPT6JT9uYuPacW0Wx8WuixNBBxmaGtzj8d7eHlGM/sHCjjM6TInS3tzy0Yy5BZN02XsAnSbRg1LVhrBIYxgJiAXCWsBwwkoGBleh8yqDyzh8ECgluZ/59x/qZxPosQE7kIq87KxZYXARQgYls8lH/BYTDOKkbMzJRZj7mu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFYFA2T9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFYFA2T9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so2615767f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 04 May 2026 12:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777921550; x=1778526350; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
        b=LFYFA2T9+QNkHE2NB1H5lRI6heDKGhtcLeVO8qVXOKy6GlY24eOjod0Sx0p7QTA04C
         9prHeLivqgEise+4hL5/7GZOpFAz3kK7jvrfgohxoqkF86/COLK8a5Us2YJB/VpPWGLL
         vZFpEjwNEbCP2u21BSGy2HgAAnvccH8xLB6USLEF7L8IcT+v9iWWLyZMzcBBWe9ykFbf
         Nzpmm7Ndn1kvUPkFJ4gwawnx0UItgXe0lKSAxyaMFsU6UUf8M191+NEFOb1QKFQYUqoz
         JkNllIYrXksBCrL2hQcIiNNP1Inxc+oyVRvPygMKBEoRwPGsXzl0SP7J7qnPDShN8gzp
         fVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921550; x=1778526350;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
        b=FbdVDLrORJCrAgCPcmJajwdCFbP3BcFnFYXaJ9DZ6i4NazsXja48pUuUZ49HxhB6Mo
         j1xTGUXt3f7mhRYxePpjtZQf7E4o9E/JWFCbbIPdSGSYGC1jE57dbuMyb+AB7Poclzh+
         ullqVamERLvE35xkIlNvGOt/5DV68ezO05q3oyZEAOS4HWWvmeodOUyzJXUrKSAe8saK
         HFU7G4QE4oZCFfzL+wVwYITMc5Q9ZnplRbSfcKHUzRLgJCa57aMUM5yx3n4wlzbHk1D4
         6f4fZeM1GSL+H6Z3VSU9lqmJDy18BY+UrfaHm9vK0vc8CxOEg2j6ZSAvHhpV86drMWQf
         Br2A==
X-Gm-Message-State: AOJu0Yxz+GDgUR3QITb2ZULIqlPlNtbjbd14Ge9uZlN3LpxoVzFb2No+
	Xe+67fVnUwhD0Jx3ens2BiTNT7f7beLg4S3PO8SzjMkmbFXEs2CkbM4=
X-Gm-Gg: AeBDiev+/mJ7lL1DLaicM7z4ApysocStBQjBF/0REAxxhuZpMiMjXVVtiXAZkjlFHnk
	xRud0M8yjKK87HAnHTg1b/9N0RwI9/VgOWYOyZ/96zfmj9b+2AoM0j46iuIFWqo09f6cxawvkuI
	AwdIDote9SJAyxiFRjpoY9/j9rnn3if6jNwuU+xFQhJQ8dadIUN7/3yk5W0kSNMN/CWzGtP6HEH
	ccLEH74xDCw0YKxWNYo0kpFZ53xv6fNk57oEuUZpbrgza+KbnxuJnIWrELYBJjwfcQ+PmAJhF8r
	7buXYaCAgjr473r5jxn8KjSyOuQ6hAEo+Odj4OjkasHT4f0zTLDdzBLBu56HCbT1wMmpRooLPMP
	gXJ3QqYerI21Zwbfm4TQkJZ93a/+HyJOhNhaF1e43l4D1SOvWufkvE9NmvpJDJR5lpE5zsJQRHy
	zX
X-Received: by 2002:a05:6000:310e:b0:43d:a37f:8d5e with SMTP id ffacd0b85a97d-44bb472271fmr18685488f8f.18.1777921549502;
        Mon, 04 May 2026 12:05:49 -0700 (PDT)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4500d172c63sm85886f8f.8.2026.05.04.12.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:05:48 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 tristan@talencesecurity.com
Subject: Re: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware
 bssdescriptsize in scan response
Date: Mon, 04 May 2026 19:05:48 -0000
Message-ID: <177792154836.3040070.7814391775444667231@gmail.com>
In-Reply-To: <afYuwVf23vKag2XA@stanley.mountain>
References: <20260421135027.357622-3-tristmd@gmail.com>
 <202605030019.lL8x0ZPx-lkp@intel.com> <afYuwVf23vKag2XA@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Dan,

Good catch, thanks. I'll send a V4 with size_add() for both
the pkt_ptr and bssdescriptsize checks.

Thanks,
Tristan
