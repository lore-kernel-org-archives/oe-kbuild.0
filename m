Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC54C78;
	Mon, 14 Nov 2022 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57DDC433C1;
	Mon, 14 Nov 2022 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668433039;
	bh=QV8WtFPX9sVKGTjiyOjV7TGGN3nbDOd5pAWQ9Z8DwrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKhFoA7CP/W+idaCkrO6vSoBMSMPbPIBzAGJA40aX2S5x9PDWqRPcinH43k44SQvA
	 Xq1L+M8rf2og7kqq5CQo1tCaL5xvJkp6XRq4ofjTQIi+r7WgKFub/yc0lWBBmVEKxT
	 Ei3HcdCb8gohVmsZ2ixs9JQ78PfyFk18s2q/Qq+DKyg4D4dw/DikDLvYRe4K6Ec+j1
	 5KJy7CLpEbGCTBSVw1RFz85ua2cYiaZ5BOSEliYWufZBTzOCHKFYeyaZZ0dX+ZcGXT
	 FhcaXLPheygeS59qK6jnYcxB21RU9kw1SLlNaaiXzLESSUtrzlPkmmuvgMnXoOVzqr
	 LdIs6KzBpzCxA==
Date: Mon, 14 Nov 2022 14:37:14 +0100
From: Christian Brauner <brauner@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:brauner/linux/fs.xattr.simple.rework.rbtree
 1/1] fs/xattr.c:1118 simple_xattr_get() error: uninitialized symbol 'ret'.
Message-ID: <20221114133714.sglfhlw7i33avjmt@wittgenstein>
References: <202211141711.hT8AaeOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202211141711.hT8AaeOS-lkp@intel.com>

On Mon, Nov 14, 2022 at 03:50:41PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework.rbtree
> head:   b1999797db0738e60ae9730fcdd5ec6dd7604cd0
> commit: b1999797db0738e60ae9730fcdd5ec6dd7604cd0 [1/1] xattr: use rbtree for simple_xattrs
> config: m68k-randconfig-m041-20221110
> compiler: m68k-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> fs/xattr.c:1118 simple_xattr_get() error: uninitialized symbol 'ret'.
> 
> vim +/ret +1118 fs/xattr.c
> 
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1086  int simple_xattr_get(struct simple_xattrs *xattrs, const char *name,
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1087  		     void *buffer, size_t size)
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1088  {
> b1999797db0738 Christian Brauner 2022-11-04  1089  	struct simple_xattr *xattr = NULL;
> b1999797db0738 Christian Brauner 2022-11-04  1090  	struct rb_node *rbp;
> b1999797db0738 Christian Brauner 2022-11-04  1091  	int ret, seq = 0;
> b1999797db0738 Christian Brauner 2022-11-04  1092  
> b1999797db0738 Christian Brauner 2022-11-04  1093  	rcu_read_lock();
> b1999797db0738 Christian Brauner 2022-11-04  1094  	do {
> b1999797db0738 Christian Brauner 2022-11-04  1095  		read_seqbegin_or_lock(&xattrs->lock, &seq);
> b1999797db0738 Christian Brauner 2022-11-04  1096  		rbp = rcu_dereference(xattrs->rb_root.rb_node);
> b1999797db0738 Christian Brauner 2022-11-04  1097  		while (rbp) {
> b1999797db0738 Christian Brauner 2022-11-04  1098  			xattr = rb_entry(rbp, struct simple_xattr, rb_node);
> b1999797db0738 Christian Brauner 2022-11-04  1099  			if (strcmp(xattr->name, name) < 0) {
> b1999797db0738 Christian Brauner 2022-11-04  1100  				rbp = rcu_dereference(rbp->rb_left);
> b1999797db0738 Christian Brauner 2022-11-04  1101  			} else if (strcmp(xattr->name, name) > 0) {
> b1999797db0738 Christian Brauner 2022-11-04  1102  				rbp = rcu_dereference(rbp->rb_right);
> b1999797db0738 Christian Brauner 2022-11-04  1103  			} else {
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1104  				ret = xattr->size;
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1105  				if (buffer) {
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1106  					if (size < xattr->size)
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1107  						ret = -ERANGE;
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1108  					else
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1109  						memcpy(buffer, xattr->value, xattr->size);
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1110  				}
> 38f38657444d15 Aristeu Rozanski  2012-08-23  1111  				break;
> 
> "ret" is only initialized if we find "xattr->name == name".

Hey Dan,

Thanks for the report but fwiw, this version of the patchset hasn't made
it. We went with what's in -next currently. So that bug should be gone!

Thank you!
Christian
