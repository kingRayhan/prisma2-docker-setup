import express, { Application, Response } from 'express'
import cors from 'cors'
import morgan from 'morgan'
import AuthRouter from './routes/Auth'

/**
 * Initialize Express application
 */
const app: Application = express()

/**
 * Enable cors
 */
app.use(cors())

/**
 * Express Logger
 */
morgan('dev')

/**
 * Parse request Body
 */
app.use(express.urlencoded({ extended: true }))
app.use(express.json())

/**
 * Routers
 */
app.use(AuthRouter)
// When no routes matches
app.get('*', (_, res: Response) => {
    res.status(404).json({
        message: 'invalid api HI',
    })
})

/**
 * Start server
 */
const post = 4545
app.listen(post, () => console.log(`Server working at http://localhost:${post}`))
