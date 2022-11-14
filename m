Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CC023A8;
	Mon, 14 Nov 2022 09:11:05 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso13206172pjc.0;
        Mon, 14 Nov 2022 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XtpGUTIvcbVcBcCeHMdtVclFveGnvGgjA5lPc1XoL+E=;
        b=nUmF5wsnAOTKZInKWNu47y2qvbiYKSD7RM+d7TtTVe/V/6/rBxzL25ESsTOnWtfsb+
         yeaLSdL3wlIJ/jUGMDnR+kKq5mf6EYC0lSGVFtFeaPRr4Wf0C+9xf4/R+svTc0BAhNd6
         B20/WGgSKiTSKSBYR3Hr/8cZd8HsgtPKxH+6JyTNTrfxkMPKY/c4uNHeyUg+4XBE2K3O
         3JGLG4LLA6olZRa5/+k9x7gvJtgeWPvi57gjuKsr1z8VB+c2KVwGmZ3NMZ2WZamoexNS
         I7M8cZsxCB0NffYiIAmhj8V8xwx/qqrgIqKgxfsHSaXpDh87pBYPTVKtnE7qoMdT3fTi
         YyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtpGUTIvcbVcBcCeHMdtVclFveGnvGgjA5lPc1XoL+E=;
        b=k7wIB+egKkrWM7qZPCbvSo2upOgcmkDhSjDukMdQhXNdbtShWYFrXEcH9CPrQ6xAkm
         /KyVEXk1ybZE0qhWqgNQTg6MSssi2pcxp/YOEQmPrzoY/H98nSlIrqVIv4moNc1bP2jF
         G7JG+uThoYCWN8zDCp0lugzD0i13gRQaxMYaykJlojzwErWwsUDcd217hFbqgxrDBSsY
         JdRSMX1EyBaBsyPu+2tenxkUtT1nfPYyyebFrKZYa8+TyJn1TNO1816Z/2gWKyfdTApr
         fOMFeT3hHjlghJT+TrA+sNWoaBqIrabxpRom3WfhYNVA/xOLl7QIBJIdbHPivrchlXyF
         mxQA==
X-Gm-Message-State: ANoB5pkbanV9Gj+8Ux7qMRMn/KeDr/inpVPRLP2xbHE1/sgidfJh7USu
	NEWdRx2D1S5nVnGQ9wJZXmA=
X-Google-Smtp-Source: AA0mqf6L7YR/LReZ3rAijt6j+W3Xtbn39N1XZAaqyf7Ial22Wyi+OtlX9SX5TwzOKaRe0xGiYNMFYg==
X-Received: by 2002:a17:902:eb52:b0:186:cb27:4e01 with SMTP id i18-20020a170902eb5200b00186cb274e01mr12771579pli.139.1668417065330;
        Mon, 14 Nov 2022 01:11:05 -0800 (PST)
Received: from localhost ([14.96.13.220])
        by smtp.gmail.com with ESMTPSA id y7-20020aa79e07000000b0056e8eb09d58sm6387207pfq.170.2022.11.14.01.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:11:05 -0800 (PST)
Date: Mon, 14 Nov 2022 14:41:00 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, bpf@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Dave Marchevsky <davemarchevsky@meta.com>,
	Delyan Kratunov <delyank@meta.com>
Subject: Re: [PATCH bpf-next v6 11/26] bpf: Allow locking bpf_spin_lock in
 allocated objects
Message-ID: <20221114091100.xc6manlxdjad2t24@apollo>
References: <20221111193224.876706-12-memxor@gmail.com>
 <202211140520.Q5kvXPSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211140520.Q5kvXPSL-lkp@intel.com>

On Mon, Nov 14, 2022 at 01:55:01PM IST, Dan Carpenter wrote:
> Hi Kumar,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/Allocated-objects-BPF-linked-lists/20221112-033643
> base:   e5659e4e19e49f1eac58bb07ce8bc2d78a89fe65
> patch link:    https://lore.kernel.org/r/20221111193224.876706-12-memxor%40gmail.com
> patch subject: [PATCH bpf-next v6 11/26] bpf: Allow locking bpf_spin_lock in allocated objects
> config: x86_64-randconfig-m001
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> smatch warnings:
> kernel/bpf/verifier.c:5623 process_spin_lock() error: uninitialized symbol 'rec'.
>
> vim +/rec +5623 kernel/bpf/verifier.c

Hi Dan,

Thanks for the report! I noticed it yesterday night.

How should I be crediting you in the respin? Not sure Reported-by: is ok if I
incorporate the fix into the patch and resend it. Would Fixed-by: be better?

> [...]
