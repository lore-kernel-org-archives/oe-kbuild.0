Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC77383
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 02:06:28 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id h24-20020a056e021d9800b0030be8a5dd68so4898855ila.13
        for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 18:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd5wNecq6Iwv6f1dG8KNdC3uYkQa6Cax7xeMdbKruNc=;
        b=3BaNT9rEKmBQqW9pWgCcBcLGDaYdlCpImNUmP0QZPqpeVRa660+OSM0Gzkc5hijBqy
         iU6FL6wPuHsgLbrU9QY6zskXkkayrBTor9QMpEicsEi92ubBaNZ8tdw8JY06jUdESwRU
         /DvzWkhBxOxIu3ksxUSxvyHGLHEdCFDFRuOiPO/3M8A8mmghLBmnPbTXnXFjKauaUuD6
         rDJespSO2SAN2+EocfQX7UOtcAUSh+0DKMwNQ9tznncaSmFNZ0Rf0k4TfSuQOR99wB4m
         OSvIS2MEU8Zn4+ZvyhtIqO6ITa01/R5u22qQga2D7Vwwg+5a8gV4+VUtwkC/ZPR4IZNn
         U+kA==
X-Gm-Message-State: AFqh2kr3hHzHZrhZvg7jiB7u+CJLmWryRUlqCS2JWEQ18Ts/mogzOTwS
	vgfvIvauBqTzkDVQSWg36tYB/nb6DnuYmNhp7dz4YznES32+
X-Google-Smtp-Source: AMrXdXuiE0IWVmXxJeCGb0ni2t8km2avjyvmVVncmFvAcPb4QdDuRxSIc/M0BGbQD/iK6SAKylqwiFZkiLM+lWBM9yGzrPrY225N
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5d:889a:0:b0:6e0:34ee:4e97 with SMTP id
 d26-20020a5d889a000000b006e034ee4e97mr1273397ioo.38.1674266787394; Fri, 20
 Jan 2023 18:06:27 -0800 (PST)
Date: Fri, 20 Jan 2023 18:06:27 -0800
In-Reply-To: <00000000000073b14905ef2e7401@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001f3d6405f2bc9d28@google.com>
Subject: Re: [syzbot] BUG: stack guard page was hit in inet6_release
From: syzbot <syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com, 
	error27@gmail.com, hdanton@sina.com, jakub@cloudflare.com, 
	john.fastabend@gmail.com, kafai@fb.com, kernel-team@cloudflare.com, 
	kpsingh@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	lkp@intel.com, lmb@cloudflare.com, netdev@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev, pabeni@redhat.com, 
	songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 38207a5e81230d6ffbdd51e5fa5681be5116dcae
Author: John Fastabend <john.fastabend@gmail.com>
Date:   Fri Nov 19 18:14:17 2021 +0000

    bpf, sockmap: Attach map progs to psock early for feature probes

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=106884b9480000
start commit:   c8451c141e07 Merge tag 'acpi-6.2-rc2' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=126884b9480000
console output: https://syzkaller.appspot.com/x/log.txt?x=146884b9480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=04c21ed96d861dccc5cd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a1a692480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1575dc34480000

Reported-by: syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Fixes: 38207a5e8123 ("bpf, sockmap: Attach map progs to psock early for feature probes")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
