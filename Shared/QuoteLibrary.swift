import Foundation

enum QuoteLibrary {
    /// Curated daily messages mixing fe (faith/scripture) and motivación personal
    /// (secular personal growth). Each entry carries a full mini-devotional:
    /// reflection, practical teaching, question, action and prayer. This is the
    /// single source of truth for the app, the widget and the menu bar app.
    static let all: [Quote] = [
        // MARK: - Fe

        Quote(
            id: 1,
            text: "Todo lo puedo en Cristo que me fortalece.",
            reference: "Filipenses 4:13",
            category: .fe,
            reflection: "Pablo escribió esta frase no desde la comodidad, sino desde una celda. Había aprendido a estar contento tanto en la abundancia como en la escasez. Su fuerza no venía de sus circunstancias, sino de una fuente que no dependía de ellas. Cuando repetimos este versículo, no estamos pidiendo un poder mágico para lograr cualquier cosa que se nos ocurra: estamos reconociendo que la fuerza para atravesar lo que hoy nos toca no tiene que salir completamente de nosotros mismos. Puedes estar cansado, dudar, sentir que no alcanza el ánimo — y aun así sostenerte, porque lo que te sostiene no es solo tu voluntad.",
            practicalTeaching: "La fortaleza no es ausencia de cansancio, es apoyarte en algo más grande que tu cansancio.",
            question: "¿En qué área de tu vida sientes que te falta fuerza propia hoy?",
            action: "Antes de empezar tu tarea más pesada de hoy, detente 30 segundos y respira reconociendo que no la enfrentas solo.",
            prayer: "Señor, hoy reconozco delante de ti que mis fuerzas tienen límite, y que muchas veces intento sostenerlo todo como si dependiera solamente de mi propia voluntad. Gracias porque tu fuerza no se agota donde termina la mía, y porque no me pides llegar con las fuerzas completas para poder ayudarme. Sostenme en lo que hoy se siente pesado, en lo que temo no poder terminar, en lo que llevo cargando en silencio. Recuérdame, en cada momento en que sienta que no alcanzo, que no camino solo, y que tu fortaleza se perfecciona precisamente en mi debilidad. Amén."
        ),
        Quote(
            id: 2,
            text: "Porque yo sé los planes que tengo para ti: planes de bienestar y no de calamidad.",
            reference: "Jeremías 29:11",
            category: .fe,
            reflection: "Este versículo se escribió para un pueblo exiliado, lejos de casa, en medio de una espera que no entendía y que no había elegido. No era una promesa de que todo se arreglaría mañana — era la certeza de que la historia no terminaba en el destierro. A veces confundimos 'plan de bienestar' con 'ausencia de dificultad'. Pero el bienestar del que habla este texto es más profundo: es la certeza de que no estás abandonado en medio del proceso, aunque el proceso duela y aunque no veas el final todavía.",
            practicalTeaching: "Que hoy no tenga sentido no significa que no tenga propósito.",
            question: "¿Qué parte de tu presente te cuesta creer que tiene un propósito?",
            action: "Escribe una frase reconociendo un área difícil de tu vida y entrégala conscientemente, aunque no la entiendas todavía.",
            prayer: "Padre, no siempre entiendo el camino que estoy atravesando, y hay días en que se siente más como destierro que como propósito. Aun así, hoy elijo confiar en que no me has olvidado, que no soy un proyecto abandonado a la mitad, sino alguien a quien sigues sosteniendo aunque el porqué no sea claro todavía. Dame paciencia para habitar este proceso sin exigirme entenderlo por completo, y dame esperanza genuina para lo que viene: no una esperanza ingenua que niega lo difícil, sino una que confía en que tu historia conmigo no termina aquí. Amén."
        ),
        Quote(
            id: 3,
            text: "No temas, porque yo estoy contigo; no desmayes, porque yo soy tu Dios.",
            reference: "Isaías 41:10",
            category: .fe,
            reflection: "El miedo rara vez se va porque alguien nos dice 'no temas'. Se va cuando sentimos que no enfrentamos la amenaza solos. Por eso este versículo no termina en la orden — termina en la razón: 'porque yo estoy contigo'. Es una promesa de compañía, no de ausencia de peligro. Puedes seguir sintiendo miedo y aun así dar el siguiente paso, porque el miedo no tiene la última palabra sobre lo que vas a hacer hoy.",
            practicalTeaching: "No se trata de dejar de sentir miedo, sino de no dejar que el miedo decida por ti.",
            question: "¿Qué decisión estás posponiendo por miedo en este momento?",
            action: "Da un paso pequeño, concreto, hacia eso que el miedo te ha hecho evitar.",
            prayer: "Dios, reconozco mi miedo delante de ti tal como es, sin minimizarlo ni fingir que no está ahí. No te pido que lo quites por completo ni que borres la incertidumbre de lo que viene, porque sé que la fe no siempre significa ausencia de temor. Te pido, en cambio, que camines conmigo a través de él, que tu presencia sea más real para mí que la amenaza que hoy siento. Fortalece mis manos y mi corazón para dar el siguiente paso, aunque el miedo siga tocando la puerta, porque tú, mi Dios, ya estás conmigo dentro de él. Amén."
        ),
        Quote(
            id: 4,
            text: "El Señor es mi pastor, nada me faltará. En lugares de delicados pastos me hará descansar.",
            reference: "Salmos 23:1-2",
            category: .fe,
            reflection: "David escribe esto siendo un hombre perseguido, con enemigos reales y noches de huida. No es la reflexión de alguien sin problemas, sino de alguien que ha aprendido a distinguir entre estar en peligro y estar desamparado. El pastor no promete un camino sin valles — el mismo salmo habla del 'valle de sombra de muerte' unos versos después. Promete presencia dentro del valle. Descansar aquí no es la ausencia de amenaza, es la certeza de que hay alguien cuidando el rebaño incluso cuando el camino es oscuro.",
            practicalTeaching: "Puedes estar en un valle y aun así estar cuidado.",
            question: "¿Dónde necesitas permitirte descansar hoy, aunque el problema siga sin resolverse?",
            action: "Aparta 10 minutos hoy solo para estar en silencio, sin resolver nada, solo para descansar.",
            prayer: "Pastor mío, hoy te entrego mi necesidad de tenerlo todo resuelto antes de poder descansar, esa exigencia silenciosa que me impide soltar el control incluso cuando estoy agotado. Sé que no me prometes un camino sin valles, pero sí prometes estar presente en cada uno de ellos, guiándome incluso cuando no puedo ver más allá del siguiente paso. Ayúdame a recostarme en lugares de delicados pastos aunque el problema siga sin resolverse, a beber de aguas de reposo aunque la incertidumbre continúe alrededor. Que pueda distinguir hoy entre estar en peligro y estar desamparado, porque contigo como pastor, sé que nunca estoy realmente solo. Amén."
        ),
        Quote(
            id: 5,
            text: "Venid a mí todos los que estáis trabajados y cargados, y yo os haré descansar.",
            reference: "Mateo 11:28",
            category: .fe,
            reflection: "Esta invitación no pide que primero resuelvas tu cansancio para poder acercarte — pide que te acerques cargado, tal como estás. Muchas veces posponemos el descanso espiritual hasta 'tener todo en orden', como si hiciera falta merecerlo. Pero la invitación es exactamente al revés: ven cargado, ven cansado, ven sin haber resuelto nada todavía. El descanso que se ofrece aquí no es la ausencia de responsabilidades, es un lugar donde soltar el peso por un momento antes de seguir caminando.",
            practicalTeaching: "No necesitas tener todo resuelto para merecer un momento de descanso.",
            question: "¿Qué carga has estado sosteniendo sola/o que podrías soltar, aunque sea por hoy?",
            action: "Nombra en voz alta (o por escrito) una carga específica y suéltala conscientemente, aunque el problema siga ahí mañana.",
            prayer: "Señor, vengo a ti cansado y cargado, tal como estoy, sin haber resuelto todavía lo que me pesa y sin la fuerza que quisiera tener. Gracias porque tu invitación no depende de que yo llegue perfecto, con todo en orden o con una fe impecable; me basta con venir tal como soy. Enséñame a llevar tu yugo, que es más ligero que el que yo mismo me impongo, y a aprender de tu mansedumbre en lugar de exigirme más de lo que hoy puedo dar. Dame ese descanso verdadero que no depende de terminar la lista de pendientes, sino de saber en quién estoy apoyado. Amén."
        ),
        Quote(
            id: 6,
            text: "Confía en el Señor de todo tu corazón, y no te apoyes en tu propia prudencia.",
            reference: "Proverbios 3:5",
            category: .fe,
            reflection: "Confiar 'de todo corazón' es distinto a confiar a medias mientras seguimos calculando un plan B por si acaso. Este proverbio no pide dejar de pensar o de planear — pide no poner la seguridad última en el propio cálculo. Es una invitación incómoda para quien le gusta tener el control, porque implica soltar la ilusión de que si pensamos lo suficiente podemos garantizar el resultado. A veces la fe más honesta no es la que tiene todas las respuestas, sino la que actúa sin tenerlas todas.",
            practicalTeaching: "Planear es sabio; necesitar controlar cada variable no lo es.",
            question: "¿En qué situación estás intentando controlar un resultado que en realidad no depende solo de ti?",
            action: "Identifica una decisión pendiente y da el siguiente paso razonable, sin esperar tener el 100% de certeza.",
            prayer: "Padre, quiero confiar en ti más allá de lo que puedo calcular, planear o garantizar con mi propio entendimiento. Reconozco que muchas veces pongo mi seguridad última en tener un plan B seguro, como si necesitara controlar cada variable para sentirme tranquilo. Ayúdame a soltar esa ilusión de control y a caminar un paso a la vez contigo, confiando en que tú enderezas mis veredas incluso cuando yo no puedo ver el mapa completo. Que mi confianza no dependa de tener todas las respuestas, sino de conocerte a ti, que sí las tienes. Amén."
        ),

        // MARK: - Superación

        Quote(
            id: 7,
            text: "No es la carga la que te vence, sino la forma en que la llevas.",
            reference: "Reflexión diaria",
            category: .superacion,
            reflection: "Dos personas pueden cargar el mismo peso: una lo arrastra resentida, contando cada paso como una injusticia; otra lo lleva erguida, sabiendo que es temporal. El peso no cambia, pero la experiencia de cargarlo sí. Esto no significa fingir que todo está bien o minimizar lo difícil — significa que tienes más margen de maniobra del que crees, no sobre lo que te toca vivir, sino sobre cómo decides sostenerlo mientras lo vives.",
            practicalTeaching: "No siempre puedes elegir la carga, pero casi siempre puedes elegir la postura con la que la llevas.",
            question: "¿Qué carga actual estás llevando con más resentimiento del necesario?",
            action: "Hoy, antes de quejarte de algo pesado, nombra una razón (por pequeña que sea) por la que vale la pena sostenerlo.",
            prayer: "Señor, ayúdame a llevar lo que hoy pesa con una postura distinta a la que traigo por costumbre, sin resentimiento ni queja constante, sino con la firmeza de quien sabe que esto también es temporal. No te pido que quites la carga de encima, porque quizás todavía tiene un propósito que no alcanzo a ver; te pido fuerza para sostenerla de una manera que no me destruya por dentro. Enséñame a caminar erguido incluso cuando el peso es real, y a encontrar, en medio de lo pesado, alguna razón por la cual seguir sosteniéndolo con dignidad. Amén."
        ),
        Quote(
            id: 8,
            text: "Cada caída es información, no una sentencia.",
            reference: "Reflexión diaria",
            category: .superacion,
            reflection: "Solemos tratar el fracaso como un veredicto final sobre quiénes somos, cuando en realidad casi siempre es solo un dato: esto no funcionó, así no era. Los proyectos, relaciones y hábitos que finalmente funcionan casi nunca fueron el primer intento. Fueron el intento número siete, ajustado seis veces con la información que dejaron los anteriores. Tratar la caída como sentencia te paraliza; tratarla como información te permite ajustar y seguir.",
            practicalTeaching: "Pregúntate 'qué aprendí' antes que 'qué tan mal salió'.",
            question: "¿Qué fracaso reciente podrías releer como información útil en vez de condena?",
            action: "Escribe una frase concreta de lo que ese fracaso te enseñó, y una segunda de qué harás distinto la próxima vez.",
            prayer: "Padre, gracias porque mis caídas no son la última palabra sobre quién soy ni sobre lo que puedo llegar a ser. Muchas veces trato mis errores como sentencias definitivas, y me quedo más tiempo del necesario atrapado en la vergüenza en lugar de mirar con honestidad lo que puedo aprender. Ayúdame hoy a leer mis fracasos como información y no como condena, a levantarme sin necesitar fingir que no me caí, y a intentarlo de nuevo con la sabiduría que solo se gana cayendo. Gracias porque tu misericordia se renueva cada mañana, también para empezar otra vez. Amén."
        ),
        Quote(
            id: 9,
            text: "El miedo tocó a la puerta, la fe abrió, y no había nadie.",
            reference: "Proverbio popular",
            category: .superacion,
            reflection: "La mayoría de lo que tememos nunca llega a suceder, y de lo que sí sucede, la mayoría se puede enfrentar cuando realmente llega — no antes, no en la anticipación. El miedo anticipado suele ser más grande y más ruidoso que el problema real. Esto no quiere decir que el miedo no sea válido, sino que gran parte de su poder viene de que le abrimos la puerta antes de que siquiera haya tocado en serio.",
            practicalTeaching: "Gran parte del sufrimiento viene de vivir el problema antes de que llegue, a veces dos o tres veces.",
            question: "¿Qué porcentaje de lo que temes hoy es real y cuánto es anticipación?",
            action: "Escribe el peor escenario que imaginas y, al lado, qué harías realmente si sucediera. Notarás que sí tienes un plan.",
            prayer: "Dios, calma mi mente en este momento en que anticipo lo peor antes de que siquiera haya llegado. Reconozco que gran parte de lo que hoy me angustia vive solamente en mi imaginación, alimentado por el miedo más que por los hechos reales. Ayúdame a enfrentar lo que verdaderamente llegue, con la fuerza que me darás en su momento, y no a agotarme hoy viviendo un problema que quizás nunca suceda. Enséñame a abrir la puerta con calma, sabiendo que muchas veces, cuando el miedo finalmente toca, encuentro que ya me has preparado para eso. Amén."
        ),
        Quote(
            id: 10,
            text: "No se trata de tener tiempo, se trata de hacer tiempo para lo que importa.",
            reference: "Reflexión diaria",
            category: .superacion,
            reflection: "Nadie 'encuentra' tiempo para lo que de verdad le importa — lo protege, aunque signifique decir que no a otra cosa. La frase 'no tengo tiempo' casi siempre significa 'esto no es todavía mi prioridad', y está bien reconocerlo con honestidad en vez de usarlo como excusa. El tiempo no aparece solo; se defiende, incluso cuando lo que hay que proteger es solo media hora al día.",
            practicalTeaching: "Decir 'no tengo tiempo' es a veces una forma amable de decir 'no es mi prioridad todavía'.",
            question: "¿Qué es lo que dices querer, pero para lo que nunca 'encuentras tiempo'?",
            action: "Bloquea hoy mismo 20 minutos en tu día, sin negociarlos, para eso que llevas meses postergando.",
            prayer: "Señor, ayúdame a proteger el tiempo para lo que de verdad importa, en lugar de dejar que se lo lleve todo lo urgente pero no esencial. Muchas veces digo 'no tengo tiempo' cuando en realidad no he decidido hacer de algo una prioridad, y uso esa excusa para posponer indefinidamente lo que sé que debería cuidar. Dame el valor de decir que no a lo que no lo es, aunque incomode, y la disciplina de defender con intención los espacios que dedico a orar, a descansar y a amar a quienes están cerca de mí. Que mi tiempo refleje lo que de verdad valoro, no solo lo que se impone por costumbre. Amén."
        ),
        Quote(
            id: 11,
            text: "Tu peor día no define tu destino, solo es un capítulo.",
            reference: "Reflexión diaria",
            category: .superacion,
            reflection: "Cuando estamos dentro de un mal momento, es fácil confundir el capítulo con el libro entero — como si este día particularmente duro fuera un resumen de cómo va a ser todo lo demás. Pero los días difíciles casi siempre son eso: días, no sentencias. Recordar que hay más historia después de este capítulo no minimiza el dolor de hoy, solo te recuerda que no tienes que leer el final todavía basándote en una sola página.",
            practicalTeaching: "Un mal día es información sobre hoy, no una profecía sobre mañana.",
            question: "¿Qué mal momento reciente has estado tratando como si fuera permanente?",
            action: "Escribe una cosa, por pequeña que sea, que hoy salió bien — para recordar que el capítulo tiene más de una línea.",
            prayer: "Padre, hoy ha sido un día difícil, y no quiero fingir delante de ti que no lo fue. Pero confío en que este capítulo, por duro que haya sido, no es el resumen completo de la historia que estás escribiendo conmigo. Dame ojos para ver también lo bueno que hubo hoy, por pequeño que parezca, y un corazón que no confunda un mal momento con una sentencia definitiva sobre mi futuro. Ayúdame a descansar esta noche confiando en que mañana es, de verdad, una página distinta. Amén."
        ),
        Quote(
            id: 12,
            text: "Sé tan terco con tus metas como sueles serlo con tus dudas.",
            reference: "Reflexión diaria",
            category: .superacion,
            reflection: "Muchos somos increíblemente persistentes defendiendo por qué algo no va a funcionar, con la misma energía que nos falta para intentarlo. Si pusiéramos la mitad de esa terquedad defensiva a favor de nuestras metas en lugar de en contra, muchas cosas que hoy parecen imposibles se moverían un poco. La duda no es el problema — el problema es cuando le damos más disciplina a dudar que a intentar.",
            practicalTeaching: "La misma energía que usas para argumentar por qué no vas a poder, puedes usarla para intentarlo de todas formas.",
            question: "¿Qué meta has defendido más con excusas que con intentos reales?",
            action: "Da un solo paso concreto hoy hacia esa meta, aunque la duda siga presente al mismo tiempo.",
            prayer: "Señor, dame la misma persistencia para perseguir mis metas que a veces uso, sin darme cuenta, para argumentar todas las razones por las que no van a funcionar. Reconozco que a veces le doy más disciplina a la duda que al intento real, y así dejo morir en la excusa lo que podría haber crecido con esfuerzo. Ayúdame a ser terco de una manera que te honre: constante en lo que me has puesto por delante, valiente para seguir intentando después de cada tropiezo, y confiado en que tú caminas conmigo en cada paso hacia lo que hoy parece imposible. Amén."
        ),

        // MARK: - Crecimiento

        Quote(
            id: 13,
            text: "Pequeños progresos siguen siendo progreso. No lo subestimes.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "Solemos medir el progreso en saltos grandes y dramáticos, y por eso el avance lento se siente como si no contara. Pero casi todo lo que dura — un hábito, una relación sana, una habilidad — se construyó en incrementos pequeños y poco fotogénicos. El 1% de mejora diario es invisible en el corto plazo y evidente en el largo. Subestimar el progreso pequeño es la razón por la que muchos abandonan justo antes de que empiece a notarse.",
            practicalTeaching: "El progreso lento sigue siendo progreso real, aunque no se sienta impresionante hoy.",
            question: "¿Qué pequeño avance de esta semana estás descartando por no ser 'suficiente'?",
            action: "Anota un progreso pequeño de hoy, por insignificante que parezca, y reconócelo como válido.",
            prayer: "Gracias, Señor, por cada paso pequeño que di hoy, aunque a simple vista no parezca gran cosa. Ayúdame a no despreciar lo que parece poco, a no medir mi progreso solo por saltos dramáticos que rara vez llegan, sino por la fidelidad constante de seguir intentando un día tras otro. Recuérdame que tú mismo obras muchas veces en lo pequeño y lo oculto, antes de que se haga visible para los demás. Dame paciencia para confiar en el proceso lento que estás formando en mí. Amén."
        ),
        Quote(
            id: 14,
            text: "No busques ser el mejor, busca ser mejor que ayer.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "Compararte con 'el mejor' casi siempre es una comparación injusta, porque estás viendo el resultado final de alguien más y comparándolo con tu proceso a medias. Compararte con tu propio ayer, en cambio, es una medida honesta: usa la misma información, el mismo punto de partida, el mismo contexto. Es también la única comparación que realmente puedes controlar.",
            practicalTeaching: "La única comparación justa es contigo mismo de ayer, no con la versión pulida de otra persona.",
            question: "¿Con quién te has estado comparando de forma injusta últimamente?",
            action: "Identifica una forma concreta en la que hoy puedes ser 1% mejor que ayer, no que los demás.",
            prayer: "Padre, líbrame de la costumbre de compararme injustamente con otros, midiendo mi proceso a medias contra el resultado final y pulido de alguien más. Ayúdame a ver con gratitud mi propio camino, con sus tiempos, sus tropiezos y sus pequeños avances, sabiendo que tú no me estás formando para ser una copia de nadie más. Que mi única comparación honesta sea con quien era ayer, y que cada mejora, por mínima que sea, se convierta en motivo de agradecimiento en lugar de una nueva excusa para sentirme insuficiente. Amén."
        ),
        Quote(
            id: 15,
            text: "El crecimiento incomoda porque te está sacando de donde ya no perteneces.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "La incomodidad del crecimiento suele confundirse con una señal de que algo va mal, cuando muchas veces es justo lo contrario: es la fricción natural de dejar un espacio que ya te queda pequeño. Los músculos crecen con la fricción del esfuerzo, no con la comodidad del reposo constante. Lo mismo pasa con el carácter, las relaciones y los hábitos: si nunca se siente incómodo, probablemente no estás creciendo, solo estás repitiendo.",
            practicalTeaching: "No toda incomodidad es una señal de alarma; a veces es una señal de que estás avanzando.",
            question: "¿Qué incomodidad reciente podría ser en realidad una señal de crecimiento y no de peligro?",
            action: "Quédate un poco más en esa incomodidad hoy en lugar de huir de ella inmediatamente.",
            prayer: "Señor, dame paz en medio de la incomodidad que trae el crecimiento, y ayúdame a no confundirla automáticamente con una señal de peligro o de que algo anda mal. Muchas veces quiero huir de la fricción que siento cuando estás sacándome de un lugar que ya me quedaba pequeño, prefiriendo la comodidad conocida a la incertidumbre de lo nuevo. Dame el valor de quedarme un poco más en esa tensión, confiando en que así como el esfuerzo fortalece el cuerpo, tú estás fortaleciendo mi carácter en este proceso. Que aprenda a reconocer tu mano incluso en lo que incomoda. Amén."
        ),
        Quote(
            id: 16,
            text: "Aprende a decir 'todavía no' en lugar de 'no puedo'.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "'No puedo' cierra la puerta; 'todavía no' la deja entornada. Es un cambio de una sola palabra que cambia por completo la relación con tus propias limitaciones actuales. No se trata de negar que hoy, en este momento, no tienes la habilidad o el recurso — se trata de no convertir ese hecho temporal en una identidad permanente. Casi todo lo que sabes hacer hoy, en algún momento fue un 'todavía no'.",
            practicalTeaching: "Una limitación de hoy no tiene por qué ser una limitación permanente.",
            question: "¿Qué 'no puedo' llevas repitiendo que en realidad es un 'todavía no'?",
            action: "Cambia esa frase por 'todavía no' en voz alta, y da un paso pequeño hacia cambiarla.",
            prayer: "Padre, ayúdame a ver mis limitaciones de hoy como algo temporal y no como una sentencia final sobre quién soy o quién puedo llegar a ser. Es fácil convertir un 'no puedo todavía' en una identidad permanente, y con eso cerrar puertas que tú mismo quieres abrir en tu tiempo. Enséñame a decir 'todavía no' con esperanza genuina, trabajando con paciencia en lo que hoy se me dificulta, confiando en que tú sigues formándome incluso en lo que parece no avanzar. Gracias porque contigo, ninguna limitación de hoy tiene la última palabra sobre mi mañana. Amén."
        ),
        Quote(
            id: 17,
            text: "Sana tu pasado, no para olvidarlo, sino para dejar de cargarlo.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "Sanar no es borrar la memoria ni fingir que algo no pasó. Es dejar de arrastrar el peso emocional de ese momento a cada situación nueva que, en realidad, no tiene nada que ver con él. Puedes recordar perfectamente algo doloroso y, al mismo tiempo, ya no reaccionar desde esa herida. Esa es la diferencia entre recordar y cargar: una es memoria, la otra es una mochila que llevas incluso donde no hace falta.",
            practicalTeaching: "Recordar el pasado y seguir reaccionando desde su dolor son dos cosas distintas.",
            question: "¿Qué situación reciente reaccionaste más desde una herida vieja que desde el presente real?",
            action: "Nombra esa herida específicamente, aunque sea solo para ti, como un primer paso para dejar de cargarla sin darte cuenta.",
            prayer: "Señor, sana las heridas que sigo cargando sin darme cuenta, esas que se activan en momentos que en realidad no tienen nada que ver con ellas. Ayúdame a recordar el pasado sin que su dolor decida por mí en el presente, a distinguir entre la memoria honesta de lo que viví y la reacción automática que me hace revivirlo una y otra vez. No te pido que borres lo que pasó, sino que transformes la forma en que lo cargo, para que pueda caminar liviano hacia lo que sigue. Gracias porque tú haces nuevas todas las cosas, también mi manera de recordar. Amén."
        ),
        Quote(
            id: 18,
            text: "No necesitas tener todas las respuestas hoy, solo el siguiente paso correcto.",
            reference: "Reflexión diaria",
            category: .crecimiento,
            reflection: "Esperar a tener el plan completo antes de moverte es una forma elegante de quedarse quieto. Casi nadie tiene el mapa entero antes de empezar; lo que sí suele tener es claridad sobre el siguiente paso, y eso basta para avanzar. El resto del camino se aclara mientras caminas, no antes. Pedirte certeza total antes de moverte es pedirte algo que ni las personas que más admiras tuvieron cuando empezaron.",
            practicalTeaching: "No necesitas ver todo el camino, solo el siguiente paso.",
            question: "¿Qué has estado posponiendo esperando tener 'todo claro' primero?",
            action: "Identifica solo el siguiente paso — no el plan completo — y date el día de hoy para darlo.",
            prayer: "Dios, no te pido ver todo el camino de una vez, porque sé que rara vez concedes ese tipo de certeza por adelantado. Te pido, en cambio, la claridad suficiente para dar el siguiente paso contigo, confiando en que el resto se irá revelando a medida que avance en obediencia. Líbrame de la parálisis de esperar tener todas las respuestas antes de moverme, y dame el valor de caminar por fe, sabiendo que tú vas delante de mí incluso en la parte del camino que todavía no puedo ver. Amén."
        ),

        // MARK: - Gratitud

        Quote(
            id: 19,
            text: "Da gracias en toda circunstancia, porque esta es la voluntad de Dios para con vosotros.",
            reference: "1 Tesalonicenses 5:18",
            category: .gratitud,
            reflection: "Este versículo no dice 'da gracias por toda circunstancia', como si tuvieras que estar agradecido por lo que duele. Dice 'en toda circunstancia' — es posible encontrar algo por lo cual agradecer incluso en medio de lo que no agradeces en absoluto. La gratitud aquí no niega el dolor presente; simplemente se rehúsa a dejar que el dolor sea lo único que se ve. Es una disciplina, no un sentimiento espontáneo, y como toda disciplina, se entrena.",
            practicalTeaching: "Agradecer en medio de la dificultad no es negar la dificultad, es negarse a que sea lo único real.",
            question: "¿Qué podrías agradecer hoy sin que eso signifique negar lo que también es difícil?",
            action: "Nombra en voz alta o por escrito una cosa buena de hoy, aunque el día en general haya sido difícil.",
            prayer: "Padre, en medio de lo que hoy me cuesta, ayúdame a ver también lo bueno que sigue presente, sin que eso signifique negar o minimizar lo que de verdad duele. Enséñame a agradecer en toda circunstancia, no por cada circunstancia, distinguiendo entre aceptar el dolor con honestidad y dejar que sea lo único que puedo ver. Gracias por lo que tengo hoy, incluso cuando no es todo lo que quisiera, y gracias porque tu fidelidad no depende de que mis circunstancias mejoren primero. Que la gratitud se convierta en una disciplina diaria, y no solo en un sentimiento pasajero de los días fáciles. Amén."
        ),
        Quote(
            id: 20,
            text: "Cada mañana son nuevas tus misericordias; grande es tu fidelidad.",
            reference: "Lamentaciones 3:22-23",
            category: .gratitud,
            reflection: "Este versículo está en medio de uno de los libros más tristes de la Biblia — un lamento sobre una ciudad destruida. Y justo ahí, en medio de la ruina, aparece esta certeza: cada mañana es nueva, no una repetición del desastre de ayer. La gratitud por un nuevo día no requiere que el día anterior haya sido bueno. Solo requiere reconocer que hoy no está obligado a ser una copia de ayer.",
            practicalTeaching: "Un mal ayer no condena el hoy a ser igual.",
            question: "¿Qué de ayer estás cargando hacia hoy sin necesidad?",
            action: "Empieza el día nombrando algo específico por lo que este nuevo día, en sí mismo, ya vale la pena agradecer.",
            prayer: "Señor, gracias por este nuevo día y por la certeza de que tus misericordias se renuevan cada mañana, sin importar cuán difícil haya sido ayer. No permitas que cargue el peso de lo que ya pasó sobre lo que hoy puede ser distinto; ayúdame a soltar el desánimo acumulado y a recibir esta jornada como lo que realmente es: una oportunidad nueva, no una simple repetición. Gracias por tu fidelidad, que es grande incluso en medio de la ruina que a veces siento a mi alrededor. Amén."
        ),
        Quote(
            id: 21,
            text: "El corazón alegre constituye buen remedio, mas el espíritu triste seca los huesos.",
            reference: "Proverbios 17:22",
            category: .gratitud,
            reflection: "La sabiduría antigua ya conectaba el estado del ánimo con el cuerpo, mucho antes de que la ciencia moderna confirmara la relación entre gratitud, alegría y salud física. No se trata de fingir alegría cuando no la hay, sino de reconocer que cultivar momentos genuinos de gratitud y ligereza no es un lujo superficial — es parte de cómo cuidamos también el cuerpo y no solo el ánimo.",
            practicalTeaching: "Cuidar tu alegría es también una forma de cuidar tu cuerpo, no un lujo aparte de lo importante.",
            question: "¿Cuándo fue la última vez que te reíste de verdad, sin estar pendiente de nada más?",
            action: "Busca hoy, aunque sea cinco minutos, algo que genuinamente te alegre o te haga reír.",
            prayer: "Señor, gracias por la capacidad de sentir alegría genuina, ese regalo que a veces doy por sentado o que postergo hasta que todo en mi vida esté resuelto. Ayúdame a no esperar a que las circunstancias sean perfectas para permitirme reír, descansar y disfrutar lo bueno que hoy me rodea. Recuérdame que cuidar mi alegría es también una forma de cuidar el cuerpo y el alma que me diste, y que un corazón alegre puede ser, en sí mismo, un acto de fe en medio de lo que todavía no se resuelve. Amén."
        ),
        Quote(
            id: 22,
            text: "Entrad por sus puertas con acción de gracias, por sus atrios con alabanza.",
            reference: "Salmos 100:4",
            category: .gratitud,
            reflection: "Hay una diferencia entre agradecer al final, cuando ya todo salió bien, y agradecer como forma de entrada — como la actitud con la que te acercas a lo que sea que venga, antes de saber cómo va a salir. Este versículo invita a la gratitud como puerta, no como conclusión: entra agradecido, no solo sal agradecido si las cosas resultaron como esperabas.",
            practicalTeaching: "La gratitud puede ser el punto de partida del día, no solo la conclusión si todo sale bien.",
            question: "¿Cómo cambiaría tu día si empezaras agradeciendo antes de saber cómo va a salir?",
            action: "Antes de revisar el teléfono o empezar tus pendientes hoy, di en voz alta una cosa por la que agradeces de antemano.",
            prayer: "Señor, hoy quiero entrar a este día agradeciendo primero, no solo al final si todo sale como espero. Que la gratitud sea la puerta por la que empiezo, y no únicamente la conclusión reservada para cuando las cosas resultan bien. Gracias de antemano por tu cuidado sobre lo que hoy no puedo controlar, por tu presencia en lo que todavía no sé cómo va a resolverse, y por la oportunidad de vivir este día completo, del principio al fin, consciente de que vengo delante de ti con alabanza. Amén."
        ),
        Quote(
            id: 23,
            text: "La gratitud convierte lo que tenemos en suficiente.",
            reference: "Reflexión diaria",
            category: .gratitud,
            reflection: "No es que tengamos poco lo que nos hace sentir insatisfechos — es que rara vez nos detenemos a valorar lo que ya tenemos antes de fijarnos en lo que falta. La gratitud no cambia la cantidad de lo que posees, cambia la relación que tienes con ello. Alguien puede tener mucho y sentir que no alcanza; otra persona con menos puede sentir plenitud genuina, y la diferencia casi nunca está en la cantidad.",
            practicalTeaching: "La sensación de 'no me alcanza' rara vez se resuelve teniendo más, sino agradeciendo lo que ya hay.",
            question: "¿Qué tienes hoy que, si lo perdieras, extrañarías profundamente?",
            action: "Nombra tres cosas simples que hoy diste por sentadas y hoy elige notarlas conscientemente.",
            prayer: "Padre, gracias por lo que ya tengo, aunque muchas veces mi mente corra directo hacia lo que todavía falta. Ayúdame a sentir, de verdad, que hoy es suficiente, no porque no tenga necesidades reales, sino porque aprendo a valorar lo que ya está en mis manos antes de anhelar lo que no. Cambia mi manera de mirar: que no sea la cantidad de lo que poseo lo que determine mi paz, sino la certeza de que tú provees y de que puedo agradecer incluso en medio de lo que aún no tengo. Amén."
        ),
        Quote(
            id: 24,
            text: "Gracias por este nuevo día: es una hoja en blanco, no una continuación de ayer.",
            reference: "Reflexión diaria",
            category: .gratitud,
            reflection: "Solemos arrastrar el estado de ánimo de un día al siguiente como si fueran el mismo capítulo. Pero cada día tiene, literalmente, su propia luz, su propio clima, sus propias personas y posibilidades — nada de eso es una copia exacta de ayer, aunque la rutina lo haga sentir así. Agradecer el día como algo nuevo es una forma de permitirte empezar de verdad, en lugar de simplemente continuar en piloto automático.",
            practicalTeaching: "Tratar cada día como una continuación automática de ayer es la forma más fácil de no vivirlo realmente.",
            question: "¿Qué parte de tu rutina tratas en automático como si fuera 'más de lo mismo'?",
            action: "Elige una sola actividad rutinaria de hoy y hazla prestando atención completa, como si fuera la primera vez.",
            prayer: "Señor, gracias por este día nuevo, una hoja en blanco que todavía no ha sido escrita y que no tiene por qué parecerse a ayer. Ayúdame a vivirlo presente, con atención genuina a las personas y a los momentos que hoy pondrás en mi camino, en lugar de dejarlo pasar en piloto automático como si fuera uno más. Que pueda notar tu mano en los detalles pequeños, y que al final del día pueda mirar atrás y reconocer que de verdad lo viví, y no solo lo dejé transcurrir. Amén."
        ),
    ]

    /// Deterministic quote of the day: the same calendar day always maps to the
    /// same quote, both in the app and in the widget, without needing to share data.
    static func quote(for date: Date) -> Quote {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date) ?? 1
        let index = (dayOfYear - 1) % all.count
        return all[index]
    }
}
