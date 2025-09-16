Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D97829B8D9;
	Tue, 16 Sep 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039405; cv=none; b=IBYE0DzSIZ4Jwc0ectjyTLIaUZP8h5whxP974+JtRT8zT0DXIfDu3NwUn7dXwFgUPo7bHKZPIWtwlLo8yQKJ7xmdHeGn1UTlySgTlZ+G5XlHdJQDpMYKLQis6sLm9t5SkdDO75VOXeosUtKcfS4sId8EUwgsJ3jdzPcUhj5QmKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039405; c=relaxed/simple;
	bh=JTi+MWXS+EfrAK4qsiJ8BHsx9oeFME/JV3lkZOsAJf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdGodrRrimrXGyuq9KKXSuyx2SY1V4rRpNXG1SM5RL/lFZ2aEayPyr+sDU+3nu5CA8NL9Q5JbnK2FsmQ7wKz1QNLGSUf1IKxfs/mN44cF+UEQwd9GQE321Tgbk+TLNk5cLR3wVthZ8qlVCV/g3p2jjeZt2yHvpM5DZSr7H9TwkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC53C4CEEB;
	Tue, 16 Sep 2025 16:16:43 +0000 (UTC)
From: Chuck Lever <chuck.lever@oracle.com>
To: NeilBrown <neilb@ownmail.net>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	oe-kbuild@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v2] nfsd: move name lookup out of nfsd4_list_rec_dir()
Date: Tue, 16 Sep 2025 12:16:26 -0400
Message-ID: <175796544274.8037.397805260300460361.b4-ty@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
References: <202509131751.4STnDcZg-lkp@intel.com>, <175781199938.1696783.3669146136396360246@noble.neil.brown.name>, <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>, <175788975119.1696783.10090163184150858167@noble.neil.brown.name>, <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com> <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Sep 2025 12:55:13 +1000, NeilBrown wrote:
> nfsd4_list_rec_dir() is called with two different callbacks.
> One of the callbacks uses vfs_rmdir() to remove the directory.
> The other doesn't use the dentry at all, just the name.
> 
> As only one callback needs the dentry, this patch moves the lookup into
> that callback.  This prepares of changes to how directory operations
> are locked.
> 
> [...]

Applied to nfsd-testing, thanks!

[1/1] nfsd: move name lookup out of nfsd4_list_rec_dir()
      commit: 2f9cc710ed12ee9b3767586cc99cbd61125a08b3

"checkpatch.pl" reports:

From:/Signed-off-by: email address mismatch: 'From: NeilBrown <neilb@ownmail.net>' != 'Signed-off-by: NeilBrown <neil@brown.name>'

"b4 am" reports:

  ✗ BADSIG: DKIM/messagingengine.com
  ✗ BADSIG: DKIM/ownmail.net

The patch did not go to linux-nfs@vger.kernel.org, so it is
archived only under oe-kbuild@lists.linux.dev.

Since this is already the second resend, I've applied it anyway.

--
Chuck Lever <chuck.lever@oracle.com>
