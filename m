Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C753219EA
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 18:01:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E6A24320094D;
	Mon, 25 Sep 2023 14:01:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 14:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bur.io; h=cc:cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1695664874; x=1695751274; bh=r0
	oY9N5cuNjjODnfk7oEJjQ6v9N4ZL6/gX4fAQzdPX4=; b=h1jeXQDssrmzTEXDGo
	wGLFqmyxW5vbnioets4XCzxVqZeOBxVsiLgn1yDI+F0jVyqzmfcx5xkTk5ICyxAC
	Mqhm2HSvxqkfpYAfrgfBRX3X63wvngzus0XNb7eRcr6hnLl+DYJ1tUmCPnG4DAHZ
	nyClM7jDON3eUcwR8XkiLCxXwPmJzkgghpd7vfg4CtsPf8Omgiv7n9kv1IlPbIih
	DnyE8DiSzKfCPFq2s2R4JbMsP8z6S6M+w34kdMbKD5RP0AJYArqY0Qxj8HRYd4QF
	ddLd2fKWRZWK9Oni7qcNHuFDxGF5Hajvh9mvc0gfUWVX9fGpSUx+5dNBP8QaLmqh
	9eDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695664874; x=1695751274; bh=r0oY9N5cuNjjO
	Dnfk7oEJjQ6v9N4ZL6/gX4fAQzdPX4=; b=Z52wiOMBBcqL9RRkAeZ3SYC4rC69s
	7iH9UDQdNtM3uonN+p5d57V+QsS41K/N53Zwi4Scyxpuv1CXFB4sclrNeAPHCe7j
	fu++js6pMZYDAKqeM29B+Ng6Sl1EGXKBiE7Vvvj9/1BnQrTAcFJ2ToXA5C4Eewvc
	tV+XodxZ/RSLFMV470xfVl2WFbBoPgR4/8XMXCjVJFS4znVGP7UMLKeZIVnGFSjd
	pORPJADcX83DnPXElwEi4msgBfIyO9vjkSap37yx+b80Ac4kiw4qFDS3lSNjIGOR
	F2JANV82sGGYcEZdLFzVs1QzrbC3MAKHzicTzvgjNBtUQw5pi4uCeDu+w==
X-ME-Sender: <xms:6coRZaJvOaJa7fhI-tRE78WjY1NdP8PGPqBVpvkOgQjKnmF-A2FXeg>
    <xme:6coRZSIwDlr_5lGTfBv0B_EIUORACrQZ6gRkkhkB96npS257EQsIIVLZd3o3IgWAo
    -hOSxNsmDrcuoD7xEk>
X-ME-Received: <xmr:6coRZatiAeqVxtiiJlp3n19WLGj57TameCfo16bG4QY_BKoOvlJ_0NB7b5zSv_V9e4TI6ePpTIq8NPSw9lZtiqjUxgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhr
    ihhsuceuuhhrkhhovhcuoegsohhrihhssegsuhhrrdhioheqnecuggftrfgrthhtvghrnh
    epveeuvedtveegueeiheeiieetfedvieeghffftddvfedtgeejlefggfeiuddvtdfhnecu
    ffhomhgrihhnpehgihhthhhusgdrtghomhdptddurdhorhhgpdhkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhr
    ihhssegsuhhrrdhioh
X-ME-Proxy: <xmx:6coRZfYQxGXauehB4aahFAz_bk6NKUynw7wIbMLmhPdcZ1NTS1F7yg>
    <xmx:6coRZRYBxK5w49xnFUH3CwkEEdxkeJoZIIy9Bp2r9Q5NjtJJ2QKJMA>
    <xmx:6coRZbDWnBdoBoBqu9jOAgTMqnKPwGDg1O7se1U9Juo0z4t99Vr3qg>
    <xmx:6soRZQnb6dIbYRuJBpmjnYfhCZB4lbu1LSm7UDqd5OSThrJpgOPllA>
Feedback-ID: i083147f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Sep 2023 14:01:12 -0400 (EDT)
Date: Mon, 25 Sep 2023 11:02:15 -0700
From: Boris Burkov <boris@bur.io>
To: David Sterba <dsterba@suse.cz>
Cc: Julia Lawall <julia.lawall@inria.fr>, David Sterba <dsterba@suse.com>,
	oe-kbuild@lists.linux.dev
Subject: Re: [kdave-btrfs-devel:misc-next 105/126]
 fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303
Message-ID: <20230925180215.GA171077@zen.localdomain>
References: <202309230501.FnBPmnOv-lkp@intel.com>
 <alpine.DEB.2.22.394.2309231652390.15175@hadrien>
 <20230925175311.GS13697@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925175311.GS13697@suse.cz>

On Mon, Sep 25, 2023 at 07:53:11PM +0200, David Sterba wrote:
> On Sat, Sep 23, 2023 at 04:56:44PM +0200, Julia Lawall wrote:
> > Please check the tests on lines 3302 and 3304 and see if they both can be
> > true.  If they cannot, perhaps an else code be added to make that apparent
> > in the code.
> > 
> > On Sat, 23 Sep 2023, kernel test robot wrote:
> > 
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > TO: Boris Burkov <boris@bur.io>
> > > CC: David Sterba <dsterba@suse.com>
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git misc-next
> > > head:   8e6405aa4724626637e23a02ab145b0c69edb7d7
> > > commit: 356d8a4649959f1cb271fbdf7052447592b1d2ec [105/126] btrfs: qgroup: simple quota auto hierarchy for nested subvolumes
> > > :::::: branch date: 3 hours ago
> > > :::::: commit date: 22 hours ago
> > > config: i386-randconfig-053-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > | Closes: https://lore.kernel.org/r/202309230501.FnBPmnOv-lkp@intel.com/
> > >
> > > cocci warnings: (new ones prefixed by >>)
> > > >> fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303
> 
> Is there a reason whye the mails haven't been CCed to linux-btrfs@vger?
> I don't know if the build bot reports are always relevant so it may make
> sense to report it privately first and then to forward after a human
> review.

Along those lines, this one is legit, so thank you very much for the
catch and report.

I'll be sending a fix shortly.
