Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC84C6A;
	Mon, 14 Nov 2022 12:50:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k8so18075592wrh.1;
        Mon, 14 Nov 2022 04:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebPDjnpT9FEZbqx8WX9mvWvezyz1UR4PKe1b2ct2IXY=;
        b=msIHLa7KKo7g2crtm4xgt7zDxZsWalrj/HzmaP6W6YGmd3aIZlcVUtGmiBfZGIdhWv
         jFeZgCi2f7+jT+fKpfyjTzj1NmTGOTYhTtG95aIG7v9RfKymPjcVusQYSg2oO11DYvTA
         m5fcjwKdJ9+QnUXaxfg4dNrB/qIrLYvyyuR6fWVipAjnKmqw2fSIiU2wFKcGpx6fLd66
         6/qSRo6nHYIc5/s4i3DqdZV8rndK3a9Bm4ALiACsuEAnfEXm9ABWF6uItgVfX62nKUU7
         WcHnIw5Hd1Etb8aD0QgA576EpM+WjZEuqG6z0epqfpqYeOwRx3673HEm3Bi1tXvVnn/O
         d6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebPDjnpT9FEZbqx8WX9mvWvezyz1UR4PKe1b2ct2IXY=;
        b=1udrDRhe2c7fmxeje/PLPTgg1dUdLVP1cW04cqlzYMLsw+H+wHEy+lvReCtC6QfK6e
         AOoFfH28o5+DOSvQa6tLBwoXhjc/A0W4pUhXW3OU2hOymGEdiezXzkWzA4iiQIwRUeRJ
         L3Ir37qtE1LkzKrRswprtudmG5RXUgmkREZjQXa35PJVOX/zAfllgMVvzaGcXRMWnWLR
         k06HlL62H3xv64L27LCSYgBKfkgYOJoO/L8QTo8OVBip0BKdhDuzZFUNaMDlt2DwtA07
         hnvOOyrR3T44wo9gAYEnLr+13g4ByuDMXtZOceIapZ/Of5jhOx2ZwzJU2C6JaAfV53M6
         Oipg==
X-Gm-Message-State: ANoB5pnuss91hvTJ+jYDyk4+o09VhsL+i4idMWdo28vTkDAX5gtGey+3
	SVgsJLoTJmu73mk1BV3UUSVNzz8lX75+tQ==
X-Google-Smtp-Source: AA0mqf55Un/hIeoazH3lCovZ8BocgSBuLTf7zWrQrwo6lVqkC3dsYQ/AJHTYmWoQlB6zE/S66Wxj+Q==
X-Received: by 2002:a5d:4688:0:b0:230:d617:4dc2 with SMTP id u8-20020a5d4688000000b00230d6174dc2mr7762482wrq.652.1668430244679;
        Mon, 14 Nov 2022 04:50:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003cfa622a18asm18237458wma.3.2022.11.14.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 04:50:43 -0800 (PST)
Date: Mon, 14 Nov 2022 15:50:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:brauner/linux/fs.xattr.simple.rework.rbtree 1/1]
 fs/xattr.c:1118 simple_xattr_get() error: uninitialized symbol 'ret'.
Message-ID: <202211141711.hT8AaeOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221114125041.ZlJTcE5CXnWEDTuVsaK406D4xqFGERaz-VeNU6qa-sk@z>

tree:   https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework.rbtree
head:   b1999797db0738e60ae9730fcdd5ec6dd7604cd0
commit: b1999797db0738e60ae9730fcdd5ec6dd7604cd0 [1/1] xattr: use rbtree for simple_xattrs
config: m68k-randconfig-m041-20221110
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/xattr.c:1118 simple_xattr_get() error: uninitialized symbol 'ret'.

vim +/ret +1118 fs/xattr.c

38f38657444d15 Aristeu Rozanski  2012-08-23  1086  int simple_xattr_get(struct simple_xattrs *xattrs, const char *name,
38f38657444d15 Aristeu Rozanski  2012-08-23  1087  		     void *buffer, size_t size)
38f38657444d15 Aristeu Rozanski  2012-08-23  1088  {
b1999797db0738 Christian Brauner 2022-11-04  1089  	struct simple_xattr *xattr = NULL;
b1999797db0738 Christian Brauner 2022-11-04  1090  	struct rb_node *rbp;
b1999797db0738 Christian Brauner 2022-11-04  1091  	int ret, seq = 0;
b1999797db0738 Christian Brauner 2022-11-04  1092  
b1999797db0738 Christian Brauner 2022-11-04  1093  	rcu_read_lock();
b1999797db0738 Christian Brauner 2022-11-04  1094  	do {
b1999797db0738 Christian Brauner 2022-11-04  1095  		read_seqbegin_or_lock(&xattrs->lock, &seq);
b1999797db0738 Christian Brauner 2022-11-04  1096  		rbp = rcu_dereference(xattrs->rb_root.rb_node);
b1999797db0738 Christian Brauner 2022-11-04  1097  		while (rbp) {
b1999797db0738 Christian Brauner 2022-11-04  1098  			xattr = rb_entry(rbp, struct simple_xattr, rb_node);
b1999797db0738 Christian Brauner 2022-11-04  1099  			if (strcmp(xattr->name, name) < 0) {
b1999797db0738 Christian Brauner 2022-11-04  1100  				rbp = rcu_dereference(rbp->rb_left);
b1999797db0738 Christian Brauner 2022-11-04  1101  			} else if (strcmp(xattr->name, name) > 0) {
b1999797db0738 Christian Brauner 2022-11-04  1102  				rbp = rcu_dereference(rbp->rb_right);
b1999797db0738 Christian Brauner 2022-11-04  1103  			} else {
38f38657444d15 Aristeu Rozanski  2012-08-23  1104  				ret = xattr->size;
38f38657444d15 Aristeu Rozanski  2012-08-23  1105  				if (buffer) {
38f38657444d15 Aristeu Rozanski  2012-08-23  1106  					if (size < xattr->size)
38f38657444d15 Aristeu Rozanski  2012-08-23  1107  						ret = -ERANGE;
38f38657444d15 Aristeu Rozanski  2012-08-23  1108  					else
38f38657444d15 Aristeu Rozanski  2012-08-23  1109  						memcpy(buffer, xattr->value, xattr->size);
38f38657444d15 Aristeu Rozanski  2012-08-23  1110  				}
38f38657444d15 Aristeu Rozanski  2012-08-23  1111  				break;

"ret" is only initialized if we find "xattr->name == name".

38f38657444d15 Aristeu Rozanski  2012-08-23  1112  			}
b1999797db0738 Christian Brauner 2022-11-04  1113  		}
b1999797db0738 Christian Brauner 2022-11-04  1114  	} while (need_seqretry(&xattrs->lock, seq));
b1999797db0738 Christian Brauner 2022-11-04  1115  	done_seqretry(&xattrs->lock, seq);
b1999797db0738 Christian Brauner 2022-11-04  1116  	rcu_read_unlock();
b1999797db0738 Christian Brauner 2022-11-04  1117  
38f38657444d15 Aristeu Rozanski  2012-08-23 @1118  	return ret;
38f38657444d15 Aristeu Rozanski  2012-08-23  1119  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

