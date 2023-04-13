Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A236A;
	Thu, 13 Apr 2023 04:48:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso3166890wmo.0;
        Wed, 12 Apr 2023 21:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681361338; x=1683953338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+h42QyBVa53yPddmSKh7iq2A8MWhipGEiLZVqC1LKgg=;
        b=ps9wtonlNT+tqY6TnsClhzAiAFtm3I0dacG0Pf3+5Ea90bW0vUhcbUOgWM4/MjQgZ0
         bJUhetmII/Xvt0ZtxRzJoIgRvoL7n3qZaqbUODZlvrQuwjl/DFBYNy2s8Uu3NmKhNuMr
         M5ISVU2SW2Y3vV4+q9zCAgma3aIqvlMlM9jvcpvFLoaCk607EprsYCvkjR0u1B4ul7jk
         8dZdQB0gQyQDX5CW/cOYxUk7rl8gJkNCLhyHMQ+/NjIbfvyDNTgmf8L5O2QEOvJlfZ/S
         mgVLTQaBzcmBX3rCcWAA+L5jgu8e2P0KFnOaTUbvQERBHqc69nPq81XXmWecRZXUk3Ei
         qO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681361338; x=1683953338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h42QyBVa53yPddmSKh7iq2A8MWhipGEiLZVqC1LKgg=;
        b=h53GEWcRm6iQWrop0sfuVB3xCrep2XHg29k4r1Hq4ePoN1GhSDmVcyOWbfJv/W9OaE
         UlL3OTYl5oaSdn4KYFsBGbelCVx4i2jEGp0LPUDiePRzB4nFLro0m0FVl8FyyJskmv27
         StFOo72qVeaRLWjCk1D9+AoNYER7Ua0dYFU8xn3zRkptL5gGI8V6XkAp52qB9KWaXMPx
         0qAqQizpz0usjDcuo4YJnDwMA4mYHDG7zbkTKj4vj2xPI7MN/Rlxk476zpJi8i+bjM1G
         PtEYYQagfiY9ANU+B4H+f6UT8kU1xdCgn9sJpfN2AnWiwpE6g+U2aLGLoymlMf7jY/Xj
         tuvA==
X-Gm-Message-State: AAQBX9dlSTP2qns81RfxVu2Hi4krpDq7GsqazTWvzK+AnrsmLfpSFxkP
	tO+ngrKSCj/vB01srn6KwQM=
X-Google-Smtp-Source: AKy350ZuLAek0YDbiXQwQIpxy8KrdVL0lTtYEuVRUNTMywF3J9qspljASA407X4sJvJjyVkVSdOAsg==
X-Received: by 2002:a05:600c:548a:b0:3ee:782b:2e31 with SMTP id iv10-20020a05600c548a00b003ee782b2e31mr335818wmb.9.1681361337644;
        Wed, 12 Apr 2023 21:48:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b003ee1e07a14asm4271085wmq.45.2023.04.12.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:48:57 -0700 (PDT)
Date: Thu, 13 Apr 2023 07:48:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, "lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Message-ID: <dcae7c28-89b5-4f3f-b13b-1a1dc5779d1c@kili.mountain>
References: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
 <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
 <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>

The divide makes sense in context then...  Thanks for the explanation.

This check seemed like a useful thing and found a couple bugs but it
turns out that condition divides can be the most readable thing in
context.  So it maybe has a too high false positive rate.

regards,
dan carpenter

