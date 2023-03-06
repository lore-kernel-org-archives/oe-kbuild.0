Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC97E;
	Mon,  6 Mar 2023 09:41:20 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1678095672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOrGTM7BDYE8QZ2J/VBzKXeTEqRBMGFOKicW/V1olgY=;
	b=YVXCXkGKBZXVVczCkr2vnhgv9hPBD3lFgSZbudMoHlgQ4aioGpCVxmflaqatuNknTHydCJ
	Fa8oKMGiUhncuietpVmVYAUwzbwZvpMP8W/lFr0LxCQ2f4xD8mQKuJprsLKFTKB5sHGMNR
	4tHn/I9wDaq0uF7XTcwA0aq8jhy7Zqjh5dDD/Ejk0nlMxzFzO5W4+a+Gxvv7WnPyliEh3F
	Q6/q8tPWzF5OOy/vA2IuixuobYvve7epbYL2zZAumbDdvhW6pKHcqeXY0QMVOob4odzXz3
	gy6NKmct0+Q5P1clwEhKm0sh0fW6FytoiX7/zLWG3yHi1N8DrPIKroH4Ho4HqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1678095672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOrGTM7BDYE8QZ2J/VBzKXeTEqRBMGFOKicW/V1olgY=;
	b=C9qOtz+Vf/cuqF9x3+Ppea29gy638cVUztFw2HWaFfNwI5nXLdnDEkYG5nvDxkTjOZsKmC
	eA9W/c4vr0ZtINAA==
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, Petr
 Mladek <pmladek@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v1 06/18] printk: nobkl: Add acquire/release logic
In-Reply-To: <0a7e5230-3a8d-496a-a42b-bda2dc82ea9a@kili.mountain>
References: <0a7e5230-3a8d-496a-a42b-bda2dc82ea9a@kili.mountain>
Date: Mon, 06 Mar 2023 10:45:46 +0106
Message-ID: <87356i2p7h.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-03-06, Dan Carpenter <error27@gmail.com> wrote:
> smatch warnings:
> kernel/printk/printk_nobkl.c:391 cons_try_acquire_spin() warn: signedness bug returning '(-16)'

Great catch. That function used to return bool, but recently changed to
int. The consequence of the bug is that a waiter could prematurely abort
the spin.

diff --git a/kernel/printk/printk_nobkl.c b/kernel/printk/printk_nobkl.c
index 78136347a328..bcd75e5bd9c8 100644
--- a/kernel/printk/printk_nobkl.c
+++ b/kernel/printk/printk_nobkl.c
@@ -305,7 +305,7 @@ static bool cons_setup_request(struct cons_context *ctxt, struct cons_state old)
  * handover request setup by cons_setup_handover() is now invalidated and
  * must be performed again).
  */
-static bool cons_try_acquire_spin(struct cons_context *ctxt)
+static int cons_try_acquire_spin(struct cons_context *ctxt)
 {
 	struct console *con = ctxt->console;
 	struct cons_state cur;
