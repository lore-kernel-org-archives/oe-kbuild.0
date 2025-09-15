Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579F1C8629;
	Mon, 15 Sep 2025 02:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757904802; cv=none; b=Vq953J7nldeeBWUSOKOcHTZ3rJ+BneE7E0n/M8kK6R4atz0AJBtFgCSBhx6Ad/7AoB0+Ed4UCVKY410EwRXg9YSzmcvhdWrIbEnCqMx5FL2DI9zEKzQg1OY4//Gr0lePQBQWvnFozwZblZ2+uGc90ogFhg9ViNn3zP7dwKbKYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757904802; c=relaxed/simple;
	bh=+yMFVOutsFfyCSUF9j8gVFHJGieDj8BnzLXPa4CBUSk=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=h4o8rHyf/McZvZik2wQctt997ORqVABFGA0qm4bcDjmjCY45IHgl3UV28xI1YeSh3FoFPN2KJWPu0pMMnV85FOY/rPSTf5BHF3XKpkFOf9l7mXbW1dkFETQtbgUBlps5yk4656fg9qGhr3FhEpTIXWEpP8ls78DrPFGGa4NQsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=pHcTzrXy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WthujUcS; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="pHcTzrXy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WthujUcS"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E0D81D000F8;
	Sun, 14 Sep 2025 22:53:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 14 Sep 2025 22:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1757904799; x=1757991199; bh=CsCttMSAhKLSZynALwee7iDyk08OiT8Eq5t
	j/6Dyww4=; b=pHcTzrXyGmS1rdq0zcy/WDz+fwKkTJUG/ibHCb4d2UWqSv2U1oM
	g/Xi3QgwqDxpmfoceH2ervw0TWOx90DfASCK5gcl9cyZnkwuigry5wGBCVjZmrc3
	LQRACyoJniEhUujsNhax3AaIG0j4NnWLSG+1aPc15TMpP8Uzmte2diEAz/Utp7TE
	72o7xTIh3DIrJZePnNRIVvbHLJqC9ozHZ21DVqVdtPHomXkbq9rfi+TbhH0ONXKt
	dlGEqVqVgpZqO0a/ZSUwzcbwGGb84s7nTT8QjRGrVSj2MOJGRkVARJqQGQ1k4yGS
	BPKEIThP4vwKkv6381NYTHhIc1lXaP099jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757904799; x=
	1757991199; bh=CsCttMSAhKLSZynALwee7iDyk08OiT8Eq5tj/6Dyww4=; b=W
	thujUcSsxg9VcxsDfyTbDJe6dzftbxCWNmYy5QFxvfjMsRGJbw/AkUV7zu55VKzd
	dl4xQpEKdV7qLloEDtPEfiFRG2ihY/z6I2xsi4xoe4zuAas0bUdSvIXp7R5QMLgC
	9C6E55+K4uxyEymxGvuS2WI4ynZAtL37MDFAkqLdCbI6k0dBSHSlbOX/WICv0vV+
	+Xzme7kgWtj739vnhBoe+BEV5MU3r7HXeFwOC1jGTPmecoRn4t7Be9+LJGeoktYk
	6q7UmX+v5+XRDrPs0vVzVxj0WV/ANPnmXphjk6LwGL35x/uKrcdFYPW0qqMlIVgC
	vGZJV0y0QcFJCJErFKQtA==
X-ME-Sender: <xms:n3_HaO2pGPxlfan8EHTi5EIm6u0ChLrXh-PnfgCgIs0NgtiuAhRq5Q>
    <xme:n3_HaB0XHRK82ZMsbQ6z2orrGRIYYn2xvqW0MiXbtY7d_BUNWCqFe_WX83fmaVDSI
    DtRY0C_ExdyUA>
X-ME-Received: <xmr:n3_HaDAEE90E7rMXYVuftaoeBdcbL6rm_pKdvq0IgL42XV2FyYsc6iDx5_d2eEmUN-LCWEB5f4i1EwWhM4-3d2moY06Qkkg-o86R3XTh4k9J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffkrhesthejredttddtjeenucfhrhhomheppfgvihhluehr
    ohifnhcuoehnvghilhgssehofihnmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    duteefhfduveehvdefueefvdffkeevkefgtdefgffgkeehjeeghfetiefhgffgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnvghilhgsse
    hofihnmhgrihhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegthhhutghkrdhlvghvvghrsehorhgrtghlvgdrtghomhdprhgtph
    htthhopehovgdqkhgsuhhilhgusehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthht
    ohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehjlhgrhihtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvg
    hlrdgtohhm
X-ME-Proxy: <xmx:n3_HaA5fJMEwhlmYcY9ZWQkuP3VKbvPtwapdenRziGf0s9XZPm-l4g>
    <xmx:n3_HaEIRma07mHIfetuLs2jF5M2vKjX7Vcl_TQu9c50VPt6fAyVpDg>
    <xmx:n3_HaBuByX9n3uVVMp7plxlRO0KPhWaPRpXnofVpLLc-B96vkkh-sg>
    <xmx:n3_HaLKoXXC97HDPcyc4K0qahRuKwUdytmfwxYrgzSR4d6zPlHCmHw>
    <xmx:n3_HaAE2MYIOrTdKeKRCc-gSgJqt9nMODpq7IuHJe504dt3i6f72Azfm>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 22:53:17 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Chuck Lever" <chuck.lever@oracle.com>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 "Jeff Layton" <jlayton@kernel.org>
Subject: Re: [PATCH v2] nfsd: change nfs4_client_to_reclaim() to allocate data
In-reply-to: <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
References: <202509131751.4STnDcZg-lkp@intel.com>,
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>,
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>,
 <175788975119.1696783.10090163184150858167@noble.neil.brown.name>,
 <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
Date: Mon, 15 Sep 2025 12:53:15 +1000
Message-id: <175790479548.1696783.6200494616236377009@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Mon, 15 Sep 2025, Chuck Lever wrote:
> 
> Hi Neil,
> 
> It's the previous patch ("nfsd: move name lookup out of
> nfsd4_list_rec_dir()" that introduced this bug. Can you resend
> that one?

Argg... of course it was.  You'll have it soon.

Thanks,
NeilBrown
