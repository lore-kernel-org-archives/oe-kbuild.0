Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D6101F2;
	Wed, 17 Sep 2025 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076340; cv=none; b=e0CG2TuUmxGv6Ytj+0waHHiWTAQANlIyBV6e2W154p48CyeJg+uGJzFDemtLv2ZvHyeYMAC8N5B6/X68HPT8K5GaqFtPzMBRm/nIJwwZ+XDBddY47JPhp716ulHh6fPQRPe4jKUUX+w8+/3uuwILmiRaBsfJ+H5q0l/P1np5oaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076340; c=relaxed/simple;
	bh=VMuz4M4THTO6ZvBVv203VVWhmcVr/lu2oqGQyYfrgbw=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=S/cQf62stLo6GI6FSK/52nhx6ZUv3eEkNUtabSrtWOa5XpSwUiC8rX+i9SvS8gLvmvDo8+uUEncTN4E58RDmH0EgG6XtK4F2mwY23rLTaRdhSa7IrmKWU4nmLGAV5PlhByFhVum6ooUSy2/soqBSoxoWXe4+nzYmzm9fZbp0H0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=VraFpJOo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IqIQ4tr0; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="VraFpJOo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IqIQ4tr0"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C812EC010A;
	Tue, 16 Sep 2025 22:32:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 22:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758076337;
	 x=1758162737; bh=azsy23q+rPyxE4rkwBBnevYo80qh2aRdBdCfnlE7hzw=; b=
	VraFpJOoXW0ZPu9aZ6MbFs5o+Gg8x9TU/sdgPMiAamjqawlwoZW0eENKBDf3OYxm
	pEmGp66pRCkrregwgeCcBmeyvZDhStncOauAdPzzhwN3hxaGqxC2upAd/8lE53In
	ufmUa9pkaqSHhp3OIBota519XiLffq+FzmBamJyF3B96GuzyJAEX9CgHAYzzUJnF
	FL4xtob1M5iiIsDqMMQHENq4k1yt3VyK3amyEQFlJOcQ9uvke3KKd/OpCowzHGRf
	LL5ggh0f+zPG0WzUsk5cb4R0MeXxgb/ZzHq38GoXaC5PuGZGU7V3m0CZxeDLqj65
	PN2mgH4qO9L9j9F9liQfxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758076337; x=
	1758162737; bh=azsy23q+rPyxE4rkwBBnevYo80qh2aRdBdCfnlE7hzw=; b=I
	qIQ4tr0Xo2jELG0/1UNeta4HW3i+SVA9nODIuI5U7X2kv8+SCTjvfh4mdTpAwluU
	laBIBTxTzAO3LpXG/Lp3UU3Wk2DNHUAhrq7tB9chg9hpJ2a5HRQmTf87ll9NfUnc
	ZfmDGaGCh9mC0bln11OEXXwElk3Mpa+S2Vj8NSNPBVjJD8O5SFnF7g8JYoUIT+IF
	HvQrCIugBj10WpUAdepJzZY3Fh0F8jJDNg8yl/4Rx1b6cJ0fhCAQCLTQNBPBUTAf
	G8Cq9U/ad2Ci9eRyh8XVAJUrzp/LvqZG9AfQrnnSOF4cY8e1YH8RY452lYz/UQZn
	bwHxKgey4M81CNAPmJ3qw==
X-ME-Sender: <xms:sB3KaNlR4HkReCw7LgKmhai2WAHdpeDUb3mtdP8gihKiuA0LOoyzpw>
    <xme:sB3KaJmejXbhgRnbBpwEsmZ2YdJPiI7TP3GyO52Dkt_VK0UjfXzFw3cTdhaiKpPAx
    K46u2jMejDXXQ>
X-ME-Received: <xmr:sB3KaPwbBikm8ldEy9uEf2H31DgLOlZh7HrPyRWpPvFnD0M4LbhuaVl2a_j4vXcz4QNXrJuPO2YJrpVy3H33gfLkWztLa6DPt6X9ZUNI6XNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegvddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffksehtqhertddttdejnecuhfhrohhmpedfpfgvihhluehr
    ohifnhdfuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
    ephfevffegkeduhefhudevfeeuhefgieduteduhfdvgeeifeeliefhfeejfeefleevnecu
    ffhomhgrihhnpehofihnmhgrihhlrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhgvihhlsgesohifnhhmrghilhdrnhgvthdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhuhgtkh
    drlhgvvhgvrhesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepohgvqdhksghuihhluges
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlh
    hlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggrnhdrtggrrhhpvghn
    thgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhhlrgihthhonheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:sB3KaOrIFlfpkeJbhpXCO0e5DQFvOVablnE-lBHM27aI6OaKwAYpbQ>
    <xmx:sB3KaO7Lu68idP_1o-1yBd3Cm9wqBeJ7teSJKrixJYm6CkSFHeNVrQ>
    <xmx:sB3KaFeE2dpLN7o5ckDI79pWLm-9gCTHpJm-D8ChLRLRaMH5zPNEeQ>
    <xmx:sB3KaD7xZpzqsQTQ-E5CMj9VHv-4-e68xOkoHm_X-9ny15qI1Eo3jw>
    <xmx:sR3KaI3bNK975GavdSOozTBoB0nlCqBdZZNfVlcSUH9VRH6hWAm2_8FA>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 22:32:14 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@ownmail.net>
To: "Chuck Lever" <chuck.lever@oracle.com>
Cc: "Chuck Lever" <chuck.lever@oracle.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 "Jeff Layton" <jlayton@kernel.org>
Subject: Re: [PATCH v2] nfsd: move name lookup out of nfsd4_list_rec_dir()
In-reply-to: <175796544274.8037.397805260300460361.b4-ty@oracle.com>
References: <202509131751.4STnDcZg-lkp@intel.com>, <>,
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>, <>,
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>, <>,
 <175788975119.1696783.10090163184150858167@noble.neil.brown.name>, <>,
 <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>,
 <175790491325.1696783.7680474323247431624@noble.neil.brown.name>,
 <175796544274.8037.397805260300460361.b4-ty@oracle.com>
Date: Wed, 17 Sep 2025 12:32:12 +1000
Message-id: <175807633277.1696783.13245912067571261379@noble.neil.brown.name>

On Wed, 17 Sep 2025, Chuck Lever wrote:
> On Mon, 15 Sep 2025 12:55:13 +1000, NeilBrown wrote:
> > nfsd4_list_rec_dir() is called with two different callbacks.
> > One of the callbacks uses vfs_rmdir() to remove the directory.
> > The other doesn't use the dentry at all, just the name.
> >=20
> > As only one callback needs the dentry, this patch moves the lookup into
> > that callback.  This prepares of changes to how directory operations
> > are locked.
> >=20
> > [...]
>=20
> Applied to nfsd-testing, thanks!
>=20
> [1/1] nfsd: move name lookup out of nfsd4_list_rec_dir()
>       commit: 2f9cc710ed12ee9b3767586cc99cbd61125a08b3

Thanks.

>=20
> "checkpatch.pl" reports:
>=20
> From:/Signed-off-by: email address mismatch: 'From: NeilBrown <neilb@ownmai=
l.net>' !=3D 'Signed-off-by: NeilBrown <neil@brown.name>'

That's my fault.
I had wanted to use "neil@brown.name" for everything but it turns out
that I cannot control SPF and DKIM for that (it would be trivial for the
owner of brown.name to enable that, but they won't.).
So I've created neilb@ownmail.net and use that for sending, but set
reply-to to neil@brown.name for sign patch creation.
But my habit of removing the the first 3 lines of "git format-patch"
output when posting a patch will have to change.

However ... the email you replied to had "Reply-To: NeilBrown <neil@brown.nam=
e>"
but your reply went to "NeilBrown <neilb@ownmail.net>".
Any idea why?

>=20
> "b4 am" reports:
>=20
>   =E2=9C=97 BADSIG: DKIM/messagingengine.com
>   =E2=9C=97 BADSIG: DKIM/ownmail.net

That is weird.  The DKIM signatures should be good....

Thanks, and apoligies for messing up,
NeilBrown


>=20
> The patch did not go to linux-nfs@vger.kernel.org, so it is
> archived only under oe-kbuild@lists.linux.dev.
>=20
> Since this is already the second resend, I've applied it anyway.
>=20
> --
> Chuck Lever <chuck.lever@oracle.com>
>=20

